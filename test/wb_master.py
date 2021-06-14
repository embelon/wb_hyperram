import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

class WB_Master():

    def __init__(self, wb_clk_o, wbs_cyc_o, wbs_stb_o, wbs_we_o, wbs_addr_o, wbs_sel_o, wbs_dat_o, wbs_dat_i, wbs_ack_i, timeout = 100):
        # outputs
        self.wb_clk = wb_clk_o
        self.wb_cyc = wbs_cyc_o
        self.wb_stb = wbs_stb_o
        self.wb_we = wbs_we_o
        self.wb_addr = wbs_addr_o
        self.wb_sel = wbs_sel_o
        self.wb_dat_o = wbs_dat_o
        # inputs
        self.wb_dat_i = wbs_dat_i
        self.wb_ack = wbs_ack_i
        # internals
        self.timeout = timeout


    async def write(self, addr, sel, data):        
        await ClockCycles(self.wb_clk, 1)

        self.wb_we <= 1
        self.wb_addr <= addr
        self.wb_sel <= (sel & 0x0f)
        self.wb_dat_o <= data
        await ClockCycles(self.wb_clk, 1)

        self.wb_cyc <= 1
        self.wb_stb <= 1
        await ClockCycles(self.wb_clk, 2)

        t = self.timeout
        while self.wb_ack == 0 and t > 0:
            await ClockCycles(self.wb_clk, 1)
            t -= 1
        assert self.wb_ack == 1
        self.wb_stb <= 0
        self.wb_cyc <= 0;
        await ClockCycles(self.wb_clk, 1)

        self.wb_addr <= 0
        self.wb_sel <= 0
        self.wb_dat_o <= 0


    async def read(self, addr, sel):
        await ClockCycles(self.wb_clk, 1)

        self.wb_we <= 0
        self.wb_addr <= addr
        self.wb_sel <= (sel & 0x0f)
        self.wb_dat_o <= 0
        await ClockCycles(self.wb_clk, 1)

        self.wb_cyc <= 1
        self.wb_stb <= 1
        await ClockCycles(self.wb_clk, 2)

        t = self.timeout
        while self.wb_ack == 0 and t > 0:
            await ClockCycles(self.wb_clk, 1)
            t -= 1
        assert self.wb_ack == 1
        data = self.wb_dat_i
        self.wb_stb <= 0
        self.wb_cyc <= 0;
        await ClockCycles(self.wb_clk, 1)

        self.wb_addr <= 0
        self.wb_sel <= 0
        return data
