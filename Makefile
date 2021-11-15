
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
	iverilog -o sim_build/sim.vvp -s test_top -s dump -g2012 test/test_top.v test/s27kl0641/model/s27kl0641.v test/dump_test_top.v src/wb_hyperram.sv src/hyperram.sv src/register_rw.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_wb_hyperram vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

show_%: %.vcd %.gtkw
	gtkwave $^

# general recipes

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean:
	rm -rf *vcd sim_build test/__pycache__

.PHONY: clean
