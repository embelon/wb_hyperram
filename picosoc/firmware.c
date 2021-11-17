/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Clifford Wolf <clifford@clifford.at>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include <stdint.h>
#include <stdbool.h>

#define MEM_TOTAL 0x20000 /* 128 KB */

// a pointer to this is a null pointer, but the compiler does not
// know that because "sram" is a linker symbol from sections.lds.
extern uint32_t sram;

#define reg_spictrl (*(volatile uint32_t*)0x02000000)
#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)
#define reg_leds (*(volatile uint32_t*)0x03000000)

#define LEDS_OFF	(~0ul)
#define LED_RED		(~4ul)
#define LED_GREEN	(~1ul)
#define LED_BLUE	(~2ul)

// --------------------------------------------------------

extern uint32_t flashio_worker_begin;
extern uint32_t flashio_worker_end;

void flashio(uint8_t *data, int len, uint8_t wrencmd)
{
	uint32_t func[&flashio_worker_end - &flashio_worker_begin];

	uint32_t *src_ptr = &flashio_worker_begin;
	uint32_t *dst_ptr = func;

	while (src_ptr != &flashio_worker_end)
		*(dst_ptr++) = *(src_ptr++);

	((void(*)(uint8_t*, uint32_t, uint32_t))func)(data, len, wrencmd);
}

void set_flash_latency(uint8_t value)
{
	reg_spictrl = (reg_spictrl & ~0x007f0000) | ((value & 15) << 16);

	uint32_t addr = 0x800004;
	uint8_t buffer_wr[5] = {0x71, addr >> 16, addr >> 8, addr, 0x70 | value};
	flashio(buffer_wr, 5, 0x06);
}

void set_flash_mode_spi()
{
	reg_spictrl = (reg_spictrl & ~0x00700000) | 0x00000000;
}

// --------------------------------------------------------

void putchar(char c)
{
	if (c == '\n')
		putchar('\r');
	reg_uart_data = c;
}

void print(const char *p)
{
	while (*p)
		putchar(*(p++));
}

void print_hex(uint32_t v, int digits)
{
	for (int i = 7; i >= 0; i--) {
		char c = "0123456789abcdef"[(v >> (4*i)) & 15];
		if (c == '0' && i >= digits) continue;
		putchar(c);
		digits = i;
	}
}

void print_dec(uint32_t v)
{
	if (v >= 1000) {
		print(">=1000");
		return;
	}

	if      (v >= 900) { putchar('9'); v -= 900; }
	else if (v >= 800) { putchar('8'); v -= 800; }
	else if (v >= 700) { putchar('7'); v -= 700; }
	else if (v >= 600) { putchar('6'); v -= 600; }
	else if (v >= 500) { putchar('5'); v -= 500; }
	else if (v >= 400) { putchar('4'); v -= 400; }
	else if (v >= 300) { putchar('3'); v -= 300; }
	else if (v >= 200) { putchar('2'); v -= 200; }
	else if (v >= 100) { putchar('1'); v -= 100; }

	if      (v >= 90) { putchar('9'); v -= 90; }
	else if (v >= 80) { putchar('8'); v -= 80; }
	else if (v >= 70) { putchar('7'); v -= 70; }
	else if (v >= 60) { putchar('6'); v -= 60; }
	else if (v >= 50) { putchar('5'); v -= 50; }
	else if (v >= 40) { putchar('4'); v -= 40; }
	else if (v >= 30) { putchar('3'); v -= 30; }
	else if (v >= 20) { putchar('2'); v -= 20; }
	else if (v >= 10) { putchar('1'); v -= 10; }

	if      (v >= 9) { putchar('9'); v -= 9; }
	else if (v >= 8) { putchar('8'); v -= 8; }
	else if (v >= 7) { putchar('7'); v -= 7; }
	else if (v >= 6) { putchar('6'); v -= 6; }
	else if (v >= 5) { putchar('5'); v -= 5; }
	else if (v >= 4) { putchar('4'); v -= 4; }
	else if (v >= 3) { putchar('3'); v -= 3; }
	else if (v >= 2) { putchar('2'); v -= 2; }
	else if (v >= 1) { putchar('1'); v -= 1; }
	else putchar('0');
}

char getchar_prompt(char *prompt)
{
	int32_t c = -1;

	uint32_t cycles_begin, cycles_now, cycles;
	__asm__ volatile ("rdcycle %0" : "=r"(cycles_begin));

	reg_leds = ~0;

	if (prompt)
		print(prompt);

	while (c == -1) {
		__asm__ volatile ("rdcycle %0" : "=r"(cycles_now));
		cycles = cycles_now - cycles_begin;
		if (cycles > 12000000) {
			if (prompt)
				print(prompt);
			cycles_begin = cycles_now;
			reg_leds = ~reg_leds;
		}
		c = reg_uart_data;
	}

	reg_leds = 0;
	return c;
}

char getchar()
{
	return getchar_prompt(0);
}

void cmd_print_spi_state()
{
	print("SPI State:\n");

	print("  LATENCY ");
	print_dec((reg_spictrl >> 16) & 15);
	print("\n");

	print("  DDR ");
	if ((reg_spictrl & (1 << 22)) != 0)
		print("ON\n");
	else
		print("OFF\n");

	print("  QSPI ");
	if ((reg_spictrl & (1 << 21)) != 0)
		print("ON\n");
	else
		print("OFF\n");

	print("  CRM ");
	if ((reg_spictrl & (1 << 20)) != 0)
		print("ON\n");
	else
		print("OFF\n");
}

uint32_t xorshift32(uint32_t *state)
{
	/* Algorithm "xor" from p. 4 of Marsaglia, "Xorshift RNGs" */
	uint32_t x = *state;
	x ^= x << 13;
	x ^= x >> 17;
	x ^= x << 5;
	*state = x;

	return x;
}

void cmd_memtest()
{
	int cyc_count = 5;
	int stride = 256;
	uint32_t state;

	volatile uint32_t *base_word = (uint32_t *) 0;
	volatile uint8_t *base_byte = (uint8_t *) 0;

	print("Running memtest ");

	// Walk in stride increments, word access
	for (int i = 1; i <= cyc_count; i++) {
		state = i;

		for (int word = 0; word < MEM_TOTAL / sizeof(int); word += stride) {
			*(base_word + word) = xorshift32(&state);
		}

		state = i;

		for (int word = 0; word < MEM_TOTAL / sizeof(int); word += stride) {
			if (*(base_word + word) != xorshift32(&state)) {
				print(" ***FAILED WORD*** at ");
				print_hex(4*word, 4);
				print("\n");
				return;
			}
		}

		print(".");
	}

	// Byte access
	for (int byte = 0; byte < 128; byte++) {
		*(base_byte + byte) = (uint8_t) byte;
	}

	for (int byte = 0; byte < 128; byte++) {
		if (*(base_byte + byte) != (uint8_t) byte) {
			print(" ***FAILED BYTE*** at ");
			print_hex(byte, 4);
			print("\n");
			return;
		}
	}

	print(" passed\n");
}

// --------------------------------------------------------

void cmd_read_flash_id()
{
	uint8_t buffer[17] = { 0x9F, /* zeros */ };
	flashio(buffer, 17, 0);

	for (int i = 1; i <= 16; i++) {
		putchar(' ');
		print_hex(buffer[i], 2);
	}
	putchar('\n');
}

// --------------------------------------------------------

uint8_t cmd_read_flash_regs_print(uint32_t addr, const char *name)
{
	set_flash_latency(8);

	uint8_t buffer[6] = {0x65, addr >> 16, addr >> 8, addr, 0, 0};
	flashio(buffer, 6, 0);

	print("0x");
	print_hex(addr, 6);
	print(" ");
	print(name);
	print(" 0x");
	print_hex(buffer[5], 2);
	print("\n");

	return buffer[5];
}

void cmd_read_flash_regs()
{
	print("\n");
	uint8_t sr1v = cmd_read_flash_regs_print(0x800000, "SR1V");
	uint8_t sr2v = cmd_read_flash_regs_print(0x800001, "SR2V");
	uint8_t cr1v = cmd_read_flash_regs_print(0x800002, "CR1V");
	uint8_t cr2v = cmd_read_flash_regs_print(0x800003, "CR2V");
	uint8_t cr3v = cmd_read_flash_regs_print(0x800004, "CR3V");
	uint8_t vdlp = cmd_read_flash_regs_print(0x800005, "VDLP");
}

// --------------------------------------------------------

void cmd_echo()
{
	print("Return to menu by sending '!'\n\n");
	char c;
	while ((c = getchar()) != '!')
		putchar(c);
}

// --------------------------------------------------------

// HyperRAM is mapped to 0x30xx_xxxx address space on Wishbone bus
// HyperRAM has 8MB -> mask is 0x007fffff
// 0x3000_0000 till 307f_ffff -> RAM / MEM inisde chip
#define hyperram_mem_base_address	0x30000000
#define hyperram_mem_mask			0x007fffff
#define hyperram_mem(offset)		(*(volatile uint32_t*)(hyperram_mem_base_address + (offset & hyperram_mem_mask)))
// 0x3080_xxxx -> register space inside chip
#define hyperram_reg_base_address	0x30800000
#define hyperram_reg_mask			0x0000ffff
#define hyperram_reg(num)			(*(volatile uint32_t*)(hyperram_reg_base_address + ((2 * num) & hyperram_reg_mask)))
// 0x3081_xxxx -> CSR space for driver / peripheral configuration
#define hyperram_csr_base_address	0x30c00000
#define hyperram_csr_mask			0x0000ffff
#define hyperram_csr_latency		(*(volatile uint32_t*)(hyperram_csr_base_address + 0x00))
#define hyperram_csr_tpre_tpost		(*(volatile uint32_t*)(hyperram_csr_base_address + 0x04))
#define hyperram_csr_tcsh			(*(volatile uint32_t*)(hyperram_csr_base_address + 0x08))
#define hyperram_csr_trmax			(*(volatile uint32_t*)(hyperram_csr_base_address + 0x0c))
#define hyperram_csr_status			(*(volatile uint32_t*)(hyperram_csr_base_address + 0x10))


void hyperram_test()
{
	volatile uint32_t read = 0;

//	reg_leds = LED_GREEN;

	print("\n");
	print("HyperRAM test....");
	print("\n");

	// write something
	hyperram_mem(0x1234) = 0xfecdba89;
	// read back
	read = hyperram_mem(0x1234);
	print("Read data: ");
	print_hex(read, 8);
	print("\n");

	// read CSRs inside HyperRAM driver
	read = hyperram_csr_latency;
	print("Latency CSR: ");
	print_hex(read, 4);
	print("\n");
	read = hyperram_csr_tcsh;
	print("Tcsh CSR: ");
	print_hex(read, 4);
	print("\n");
	read = hyperram_csr_tpre_tpost;
	print("Tpre Tpost CSR: ");
	print_hex(read, 4);
	print("\n");
	read = hyperram_csr_trmax;
	print("Read timeout CSR: ");
	print_hex(read, 4);
	print("\n");
	read = hyperram_csr_status;
	print("Status CSR: ");
	print_hex(read, 4);
	print("\n");

	read = hyperram_reg(0);
	print("Chip ID0: ");
	print_hex(read, 4);
	print("\n");
	read = hyperram_reg(1);
	print("Chip ID1: ");
	print_hex(read, 4);
	print("\n");

//	reg_leds = LEDS_OFF;
/*
	// write memory, low address, default tacc (latency) is 6 cycles (default)
	hyperram_mem(0x1234) = 0xfecdba89;

	// write latency csr
	// fixed & double latency
	// tacc = 4 cycles
	hyperram_csr_latency = 0x34;
	// read latency csr
	volatile uint32_t read = hyperram_csr_latency;
	if (read != 0x34)
	{
		// if write unsucessful, instant fail

		reg_leds = LED_RED;
		return;
	}

	// write memory, high address, tacc should be now 4 cycles
	hyperram_mem(0x7ffff4) = 0x12874562;

	// try to read memory and trigger timeout, if there's no chip connected
	read = hyperram_mem(0x135);
	read = hyperram_csr_status;
	if (hyperram_csr_status != 1)
	{
		reg_leds = LED_RED;
		return; 							// instant fail
	}
*/	
}

// --------------------------------------------------------

void main()
{
	reg_leds = LED_RED;

	reg_uart_clkdiv = 52;			// 115200bps @ 6MHz
	print("\n\n\nBooting..\n");

	set_flash_mode_spi();

	print("Total memory: ");
	print_dec(MEM_TOTAL / 1024);
	print(" KiB\n");
	print("\n");

	cmd_memtest();
	print("\n");

	cmd_print_spi_state();
	print("\n");

	print("Flash ID: ");
	cmd_read_flash_id();
	print("\n");

	print("Flash regs: ");
	cmd_read_flash_regs();
	print("\n");

	cmd_print_spi_state();
	print("\n");

	reg_leds = LEDS_OFF;

    hyperram_test();

	while (1);
}
