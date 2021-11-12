# FPGA variables
PROJECT = fpga/wb_hyperram
SOURCES= fpga/fpga_top.v src/wb_hyperram.v src/hyperram.v src/register_rw.v
ICE_DEVICE = up5k
ICE_PACKAGE = sg48
ICE_BOARD_PIN_DEF = fpga/upduino.pcf
SEED = 1

# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

all: test_wb_hyperram

# if you run rules with NOASSERT=1 it will set PYTHONOPTIMIZE, which turns off assertions in the tests
test_top:
	echo "the top module was renamed to wb_hyperram. Please run make test_wb_hyperram instead"

test_wb_hyperram:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s test_top -s dump -g2012 test/test_top.v test/s27kl0641/model/s27kl0641.v test/dump_test_top.v src/wb_hyperram.v src/hyperram.v src/register_rw.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_wb_hyperram vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

show_%: %.vcd %.gtkw
	gtkwave $^

# FPGA recipes

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

%.json: $(SOURCES)
	yosys -l fpga/yosys.log -p 'synth_ice40 -top fpga_top -json $(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICE_BOARD_PIN_DEF) 
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 20 --package $(ICE_PACKAGE) --$(ICE_DEVICE) --asc $@ --pcf $(ICE_BOARD_PIN_DEF) --json $<

%.bin: %.asc
	icepack $< $@

prog: $(PROJECT).bin
	iceprog $<

# general recipes

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean:
	rm -rf *vcd sim_build fpga/*log fpga/*bin test/__pycache__

.PHONY: clean
