import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

from test.wb_master import WB_Master


async def reset(dut):
    dut.wb_rst_i <= 1
    dut.rst_i <= 1
    dut.wbs_stb_i <= 0
    dut.wbs_cyc_i <= 0
    dut.wbs_we_i <= 0
    dut.wbs_sel_i <= 0
    dut.wbs_dat_i <= 0
    dut.wbs_addr_i <= 0

    await ClockCycles(dut.wb_clk_i, 5)
    dut.wb_rst_i <= 0
    dut.rst_i <= 0
    await ClockCycles(dut.wb_clk_i, 5) 

@cocotb.test()
async def test_all(dut):
    clock = Clock(dut.wb_clk_i, 10, units="us")
    wb_master = WB_Master(dut.wb_clk_i, dut.wbs_cyc_i, dut.wbs_stb_i, dut.wbs_we_i, dut.wbs_addr_i, dut.wbs_sel_i, dut.wbs_dat_i, dut.wbs_dat_o, dut.wbs_ack_o, 100)

    cocotb.fork(clock.start())

    await reset(dut)
    assert dut.wbs_ack_o == 0
    assert dut.wbs_dat_o == 0

    await ClockCycles(dut.wb_clk_i, 5) 

    # read tcsh CSR
    read = await wb_master.read(0x30c00008, 0x0f)
    assert read == 4

    await ClockCycles(dut.wb_clk_i, 5) 

    # read, write and read back latency CSR
    await wb_master.read(0x30c00000, 0x0f)
    assert read == 0x36
    await wb_master.write(0x30c00000, 0x0f, 0x14)
    await wb_master.read(0x30c00000, 0x0f)
    assert read == 0x14
    await wb_master.write(0x30c00000, 0x0f, 0x36)
    await wb_master.read(0x30c00000, 0x0f)
    assert read == 0x36

    await ClockCycles(dut.wb_clk_i, 5) 

    # read register space
    #read = await wb_master.read(0x30800000, 0x0f)
    #assert read != 0

    await ClockCycles(dut.wb_clk_i, 5) 

    # HyperRAM should be filled according to s27kl0641/model/s27kl0641.mem file
    #read = await wb_master.read(0x30000006, 0x0f)
    #assert read != 0
    #assert read == 7

    await ClockCycles(dut.wb_clk_i, 5) 

    # write and read some value to memory space
    value = 0xa5a54224
    await wb_master.write(0x30001000, 0x0f, value)
    #read = await wb_master.read(0x30001000, 0x0f)
    #assert read == value



    
