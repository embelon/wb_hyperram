`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [0:0] PI_rst;
  reg [31:0] PI_data_in;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_wren;
  register_rw UUT (
    .rst(PI_rst),
    .data_in(PI_data_in),
    .clk(PI_clk),
    .wren(PI_wren)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$formal$register_rw.\v:44$11_CHECK  = 1'b0;
    // UUT.$formal$register_rw.\v:44$11_EN  = 1'b0;
    // UUT.$formal$register_rw.\v:47$12_CHECK  = 1'b0;
    // UUT.$formal$register_rw.\v:53$13_CHECK  = 1'b0;
    // UUT.$formal$register_rw.\v:53$13_EN  = 1'b0;
    // UUT.$formal$register_rw.\v:57$14_CHECK  = 1'b0;
    // UUT.$formal$register_rw.\v:57$14_EN  = 1'b0;
    // UUT.$past$register_rw.\v:48$1$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$register_rw.\v:48$2$0  = 1'b0;
    // UUT.$past$register_rw.\v:52$3$0  = 1'b0;
    // UUT.$past$register_rw.\v:53$5$0  = 32'b00000000000000000000000000000000;
    UUT.dffreg = 32'b00000000000000000000000000000000;
    UUT.f_past_valid = 1'b0;

    // state 0
    PI_rst = 1'b1;
    PI_data_in = 32'b00000000000000000000000000000000;
    PI_wren = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst <= 1'b0;
      PI_data_in <= 32'b10000000000000000000000000000000;
      PI_wren <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst <= 1'b0;
      PI_data_in <= 32'b00000000000000000000000000000000;
      PI_wren <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst <= 1'b0;
      PI_data_in <= 32'b00000000000000000000000000000000;
      PI_wren <= 1'b0;
    end

    genclock <= cycle < 3;
    cycle <= cycle + 1;
  end
endmodule
