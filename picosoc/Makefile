
CROSS=riscv64-unknown-elf-
CFLAGS=

# ---- iCE40 Upduino 2.0 Board ----

updusim: upduino_tb.vvp upduino_fw.hex
	vvp -N $< +firmware=upduino_fw.hex

updusynsim: upduino_syn_tb.vvp upduino_fw.hex
	vvp -N $< +firmware=upduino_fw.hex

upduino.json: upduino.sv ice40up5k_spram.v spimemio.v simpleuart.v picosoc.v picorv32.v ../src/hyperram.sv ../src/register_rw.v ../src/wb_hyperram.sv
	yosys -ql upduino.log -p 'synth_ice40 -top upduino -json upduino.json' $^

upduino_tb.vvp: upduino_tb.v upduino.sv ice40up5k_spram.v spimemio.v simpleuart.v picosoc.v picorv32.v spiflash.v
	iverilog -s testbench -o $@ $^ `yosys-config --datdir/ice40/cells_sim.v`

upduino_syn_tb.vvp: upduino_tb.v upduino_syn.v spiflash.v
	iverilog -s testbench -o $@ $^ `yosys-config --datdir/ice40/cells_sim.v`

upduino_syn.v: upduino.json
	yosys -p 'read_json upduino.json; write_verilog upduino_syn.v'

upduino.asc: upduino.pcf upduino.json
	nextpnr-ice40 --freq 13 --up5k --asc upduino.asc --pcf upduino.pcf --json upduino.json

upduino.bin: upduino.asc
	icetime -d up5k -c 12 -mtr upduino.rpt upduino.asc
	icepack upduino.asc upduino.bin

upduprog: upduino.bin upduino_fw.bin
	iceprog upduino.bin
	iceprog -o 1M upduino_fw.bin

upduprog_fw: upduino_fw.bin
	iceprog -o 1M upduino_fw.bin

upduino_sections.lds: sections.lds
	$(CROSS)cpp -P -DUPDUINO -o $@ $^

upduino_fw.elf: upduino_sections.lds start.s firmware.c
	$(CROSS)gcc $(CFLAGS) -DUPDUINO -march=rv32imc -mabi=ilp32 -Wl,-Bstatic,-T,upduino_sections.lds,--strip-debug -ffreestanding -nostdlib -o upduino_fw.elf start.s firmware.c

upduino_fw.hex: upduino_fw.elf
	$(CROSS)objcopy -O verilog upduino_fw.elf upduino_fw.hex

upduino_fw.bin: upduino_fw.elf
	$(CROSS)objcopy -O binary upduino_fw.elf upduino_fw.bin

# ---- Testbench for SPI Flash Model ----

spiflash_tb: spiflash_tb.vvp firmware.hex
	vvp -N $<

spiflash_tb.vvp: spiflash.v spiflash_tb.v
	iverilog -s testbench -o $@ $^

# ---- ASIC Synthesis Tests ----

cmos.log: spimemio.v simpleuart.v picosoc.v ../picorv32.v
	yosys -l cmos.log -p 'synth -top picosoc; abc -g cmos2; opt -fast; stat' $^

# ---- Clean ----

clean:
	rm -f testbench.vvp testbench.vcd spiflash_tb.vvp spiflash_tb.vcd
	rm -f cmos.log
	rm -f upduino_sections.lds upduino_fw.elf upduino_fw.hex upduino_fw.bin
	rm -f upduino.json upduino.log upduino.asc upduino.rpt upduino.bin
	rm -f upduino_syn.v upduino_syn_tb.vvp upduino_tb.vvp

.PHONY: spiflash_tb clean
.PHONY: upduprog upduprog_fw updusim updusynsim
