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

//	reg_leds = ~0;

	if (prompt)
		print(prompt);

	while (c == -1) {
		__asm__ volatile ("rdcycle %0" : "=r"(cycles_now));
		cycles = cycles_now - cycles_begin;
		if (cycles > 12000000) {
			if (prompt)
				print(prompt);
			cycles_begin = cycles_now;
//			reg_leds = ~reg_leds;
		}
		c = reg_uart_data;
	}

//	reg_leds = 0;
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
#define HYPERRAM_MEM_SIZE			((8ul*1024ul*1024ul))
#define HYPERRAM_MEM_SIZE_WORDS		((HYPERRAM_MEM_SIZE / 4))
// HyperRAM has 8MB -> mask is 0x007fffff
// 0x3000_0000 till 307f_ffff -> RAM / MEM inisde chip
#define HYPERRAM_MEM_BASE_ADDRESS	0x30000000
#define HYPERRAM_MEM_MASK			0x007ffffc
#define hyperram_mem(offset)		(*(volatile uint32_t*)(HYPERRAM_MEM_BASE_ADDRESS + (offset & HYPERRAM_MEM_MASK)))
// 0x3080_xxxx -> register space inside chip
#define HYPERRAM_REG_BASE_ADDRESS	0x30800000
#define HYPERRAM_REG_MASK			0x0000ffff
#define hyperram_reg(num)			(*(volatile uint16_t*)(HYPERRAM_REG_BASE_ADDRESS + ((2 * num) & HYPERRAM_REG_MASK)))
// 0x3081_xxxx -> CSR space for driver / peripheral configuration
#define HYPERRAM_CSR_BASE_ADDRESS	0x30c00000
#define HYPERRAM_CSR_MASK			0x0000ffff
#define hyperram_csr_latency		(*(volatile uint32_t*)(HYPERRAM_CSR_BASE_ADDRESS + 0x00))
#define hyperram_csr_tpre_tpost		(*(volatile uint32_t*)(HYPERRAM_CSR_BASE_ADDRESS + 0x04))
#define hyperram_csr_tcsh			(*(volatile uint32_t*)(HYPERRAM_CSR_BASE_ADDRESS + 0x08))
#define hyperram_csr_trmax			(*(volatile uint32_t*)(HYPERRAM_CSR_BASE_ADDRESS + 0x0c))
#define hyperram_csr_status			(*(volatile uint32_t*)(HYPERRAM_CSR_BASE_ADDRESS + 0x10))

#define HYPERRAM_CHIP_ID0			(0)
#define HYPERRAM_CHIP_ID1			(1)
#define HYPERRAM_CHIP_CFG0			(0x800)
#define HYPERRAM_CHIP_CFG1			(0x801)

void hyperram_read_csrs()
{
	uint16_t csr;

	// read CSRs inside HyperRAM driver
	csr = hyperram_csr_latency;
	print("Latency CSR: ");
	print_hex(csr, 4);
	print("\n");
	csr = hyperram_csr_tcsh;
	print("Tcsh CSR: ");
	print_hex(csr, 4);
	print("\n");
	csr = hyperram_csr_tpre_tpost;
	print("Tpre Tpost CSR: ");
	print_hex(csr, 4);
	print("\n");
	csr = hyperram_csr_trmax;
	print("Read timeout CSR: ");
	print_hex(csr, 4);
	print("\n");
	csr = hyperram_csr_status;
	print("Status CSR: ");
	print_hex(csr, 4);
	print("\n");
}

void hyperram_read_chip_id()
{
	uint16_t id;
	uint32_t status;

	id = hyperram_reg(HYPERRAM_CHIP_ID0);
	status = hyperram_csr_status;			// status, 1 -> timeout on read	
	if (status)
	{
		print("\nID0 read timeout\n");
		return;
	}
	print("\nID0: ");
	print_hex(id, 4);
	print("\nBits for Row Address: ");
	print_dec( ((id >> 8) & 0x0f) + 1 );
	print("\nBits for Column Address: ");
	print_dec( ((id >> 4) & 0x0f) + 1 );
	print("\nManufacturer: ");
	if ((id & 0x000f) == 1)
	{
		print("Cypress\n");
	}
	else
	{
		print("Unknown\n");
	}

	id = hyperram_reg(HYPERRAM_CHIP_ID1);
	status = hyperram_csr_status;			// status, 1 -> timeout on read	
	if (status)
	{
		print("ID1 read timeout\n");
		return;
	}
	print("ID1: ");
	print_hex(id, 4);
	print("\n");
}

// read chip configuration
void hyperram_read_chip_cfg()
{
	uint16_t cfg;
	uint32_t status;

	cfg = hyperram_reg(HYPERRAM_CHIP_CFG0);
	status = hyperram_csr_status;			// status, 1 -> timeout on read	
	if (status)
	{
		print("\nCFG0 read timeout\n");
		return;
	}
	print("\nCFG0: ");
	print_hex(cfg, 4);
	print("\nDrive strength: ");
	print_hex( (cfg >> 12) & 0x07, 2);
	print("\nLatency: ");
	switch ((cfg >> 4) & 0x0f)
	{
		case 0x0: print_dec(5); break;
		case 0x1: print_dec(6); break;
		case 0xe: print_dec(3); break;
		case 0xf: print_dec(4); break;
		default: print("Reserved!");
	}
	if (cfg & 0x0008)
	{
		print("\nFixed 2 times Latency");
	}
	else
	{
		print("\nVariable 1 or 2 times Latency");
	}
	if (cfg & 0x0004)
	{
		print("\nLegacy burst");
	}
	else
	{
		print("\nHybrid burst");		
	}
	print("\nBurst length: ");
	switch (cfg & 0x0003)
	{
		case 0: print_dec(128); break;
		case 1: print_dec(64); break;
		case 2: print_dec(16); break;
		case 3: print_dec(32); break;
		default: break;
	}
	print("\n");

	cfg = hyperram_reg(HYPERRAM_CHIP_CFG1);
	status = hyperram_csr_status;			// status, 1 -> timeout on read	
	if (status)
	{
		print("CFG1 read timeout\n");
		return;
	}
	print("CFG1: ");
	print_hex(cfg, 4);
	print("\nRefresh Interval: ");	
	switch (cfg & 0x0003)
	{
		case 0: print("2 times default"); break;
		case 1: print("4 times default"); break;
		case 2: print("default (IP 1us or I 4us)"); break;
		case 3: print("1.5 times default"); break;
		default: break;
	}
	print("\n");
	if ((cfg & 0x0003) != 0)
	{
		// make distributed refresh interval shorter (for low frequency acccess)
		hyperram_reg(HYPERRAM_CHIP_CFG1) = 2;

		cfg = hyperram_reg(HYPERRAM_CHIP_CFG1);
		status = hyperram_csr_status;			// status, 1 -> timeout on read 

		if (!status || ((cfg & 0x0003) != 2))
		{
			print("Setting default Distributed Refresh Interval failed!\n");
		}
		else
		{
			print("Distributed Refresh Interval set to default\n");
		}
	}
}


#define HYPERRAM_CSR_LATENCY_FIXED_VARIABLE_MASK	(0x0020)
#define HYPERRAM_CSR_LATENCY_FIXED					(0x0020)
#define HYPERRAM_CSR_LATENCY_VARIABLE				(0x0000)
#define HYPERRAM_CSR_LATENCY_MUL_MASK				(0x0010)
#define HYPERRAM_CSR_LATENCY_DOUBLE					(0x0010)
#define HYPERRAM_CSR_LATENCY_SINGLE					(0x0000)
#define HYPERRAM_CSR_LATENCY_MASK					(0x000f)

void hyperram_set_latency(uint8_t fixed, uint8_t cycles)
{
	uint16_t cfg = 0;
	uint32_t status = 0;

	print("\nChanging latency to: ");
	print_dec(cycles);
	print(" cycles\n");

	if ((cycles < 3) || (cycles > 6))
	{
		print("Invalid number requested\n");
		return;
	}

	// read chip configuration
	cfg = hyperram_reg(HYPERRAM_CHIP_CFG0);
	status = hyperram_csr_status;			// status, 1 -> timeout on read	
	if (status)
	{
		print("CFG0 read timeout\n");
		return;
	}

	// adjust CFG0 register
	cfg &= 0xff07;
	switch (cycles)
	{
		case 3: cfg |= 0x00e0; break;
		case 4: cfg |= 0x00f0; break;
		case 6: cfg |= 0x0010; break;
		default: break;
	}
	if (fixed)
	{
		cfg |= 0x0008;
	}
	hyperram_reg(HYPERRAM_CHIP_CFG0) = cfg;

	// reconfigure CSR inside driver
	cfg = cycles;
	cfg |= fixed ? 0x30 : 0x00;
	hyperram_csr_latency = cfg;
	if (hyperram_csr_latency != cfg)
	{
		print("Setting latency in CSR failed\n");
		return;
	}

	print("Latency set ok!\n");
}


void hyperram_memtest()
{
	uint32_t cyc_count = 5;
	uint32_t stride = 256;
	uint32_t state;
	uint32_t read, write;

	print("Running hyperram memtest ");

	for (uint32_t i = 1; i <= cyc_count; i++) 
	{
		state = i;

		for (uint32_t word = 0; word < HYPERRAM_MEM_SIZE_WORDS; word += stride) 
		{
			hyperram_mem(word) = xorshift32(&state);
		}

		state = i;

		for (uint32_t word = 0; word < HYPERRAM_MEM_SIZE_WORDS; word += stride) 
		{
			read = hyperram_mem(word);
			write = xorshift32(&state);
			if (read != write) 
			{
				reg_leds = 0xff000000 | LED_RED;

				print(" ***FAILED WORD*** at ");
				print_hex(word, 8);
				print("\nWritten value: ");
				print_hex(write, 8);
				print("\nRead value: ");
				print_hex(read, 8);
				print("\n");

				reg_leds = LED_RED;

				return;
			}
		}

		print(".");
	}
}

void hyperram_write_read(uint32_t address, uint32_t data)
{
	volatile uint32_t value = 0;
	volatile uint32_t status = 0;

	// write
	hyperram_mem(address) = data;
	print("\nWriting to address: ");
	print_hex(address, 8);
	print("\nValue: ");
	print_hex(data, 8);	
	
	// read back	
	value = hyperram_mem(address);			// value
	status = hyperram_csr_status;			// status, 1 -> timeout on read
	print("\nRead Status: ");
	if (status)
	{
		print("TIMEOUT!\n");
		return;
	}
	print("OK!\n");

	print("Read data: ");
	print_hex(value, 8);	
	print("\n");
	if (value != data)
	{
		print("Write-read failed!\n");
		return;
	}
	print("Write-read ok!\n");
}

void hyperram_test()
{
	uint32_t pattern;
	volatile uint32_t value = 0;
	volatile uint32_t status = 0;

	print("\nHyperRAM test....\n");

	getchar();

	reg_leds = LED_GREEN;

	hyperram_read_csrs();

	hyperram_read_chip_id();

	hyperram_read_chip_cfg();

	hyperram_write_read(0x7ffff4, 0x12874562);
	
	reg_leds = LED_BLUE;

	hyperram_set_latency(1, 4);
	hyperram_write_read(0x1234, 0x00caffe0);

	hyperram_set_latency(0, 6);
	hyperram_write_read(0x456008, 0xdeadbeef);

	reg_leds = LEDS_OFF;

	print("\nHyperRAM memtest....\n");

	getchar();

	reg_leds = LED_GREEN;

	hyperram_set_latency(1, 6);
	hyperram_memtest();

	reg_leds = LEDS_OFF;
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

	while (1)
	{
    	hyperram_test();
	}

	while (1);
}
