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
    dut.wbs_adr_i <= 0

    await ClockCycles(dut.wb_clk_i, 5)
    dut.wb_rst_i <= 0
    dut.rst_i <= 0
    await ClockCycles(dut.wb_clk_i, 5) 

@cocotb.test()
async def test_all(dut):
    clock = Clock(dut.wb_clk_i, 10, units="us")
    wb_master = WB_Master(dut.wb_clk_i, dut.wbs_cyc_i, dut.wbs_stb_i, dut.wbs_we_i, dut.wbs_adr_i, dut.wbs_sel_i, dut.wbs_dat_i, dut.wbs_dat_o, dut.wbs_ack_o, 100)

    cocotb.fork(clock.start())

    await reset(dut)
    assert dut.wbs_ack_o == 0
    assert dut.wbs_dat_o == 0

    await ClockCycles(dut.wb_clk_i, 5) 

    CSR_BASE_ADDR = 0x30810000
    REG_BASE_ADDR = 0x30800000
    RAM_BASE_ADDR = 0x30000000

    REG_LATENCY_OFFSET = 0
    REG_TCSH_OFFSET = 8


    # read tcsh CSR
    read = await wb_master.read(CSR_BASE_ADDR + REG_TCSH_OFFSET, 0x0f)
    assert read == 4

    await ClockCycles(dut.wb_clk_i, 5) 

    # read, write and read back latency CSR
    await wb_master.read(CSR_BASE_ADDR + REG_LATENCY_OFFSET, 0x0f)
    assert read == 0x36
    await wb_master.write(CSR_BASE_ADDR + REG_LATENCY_OFFSET, 0x0f, 0x14)
    await wb_master.read(CSR_BASE_ADDR + REG_LATENCY_OFFSET, 0x0f)
    assert read == 0x14
    await wb_master.write(CSR_BASE_ADDR + REG_LATENCY_OFFSET, 0x0f, 0x36)
    await wb_master.read(CSR_BASE_ADDR + REG_LATENCY_OFFSET, 0x0f)
    assert read == 0x36

    await ClockCycles(dut.wb_clk_i, 5) 

    # read register space
    read = await wb_master.read(REG_BASE_ADDR + 0x1000, 0x0f)
    assert read != 0

    await ClockCycles(dut.wb_clk_i, 5) 

    # HyperRAM should be filled according to s27kl0641/model/s27kl0641.mem file
    read = await wb_master.read(RAM_BASE_ADDR + 6, 0x0f)
    assert read != 0
    assert read == 0x00040005

    await ClockCycles(dut.wb_clk_i, 5) 

    # write and read some value to memory space
    value = 0xa5a54224
    await wb_master.write(RAM_BASE_ADDR + 0x1000, 0x0f, value)
    read = await wb_master.read(RAM_BASE_ADDR + 0x1000, 0x0f)
    assert read == value



    
