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
  reg [3:0] PI_tpost_i;
  reg [4:0] PI_trmax_i;
  reg [0:0] PI_rst_i;
  reg [0:0] PI_wren_i;
  reg [0:0] PI_hb_rwds_i;
  reg [3:0] PI_tpre_i;
  reg [3:0] PI_tacc_i;
  reg [0:0] PI_regspace_i;
  reg [0:0] PI_clk_i;
  reg [31:0] PI_data_i;
  reg [0:0] PI_valid_i;
  reg [3:0] PI_tcsh_i;
  reg [3:0] PI_sel_i;
  reg [7:0] PI_hb_dq_i;
  reg [0:0] PI_fixed_latency_i;
  reg [0:0] PI_double_latency_i;
  reg [31:0] PI_addr_i;
  hyperram UUT (
    .tpost_i(PI_tpost_i),
    .trmax_i(PI_trmax_i),
    .rst_i(PI_rst_i),
    .wren_i(PI_wren_i),
    .hb_rwds_i(PI_hb_rwds_i),
    .tpre_i(PI_tpre_i),
    .tacc_i(PI_tacc_i),
    .regspace_i(PI_regspace_i),
    .clk_i(PI_clk_i),
    .data_i(PI_data_i),
    .valid_i(PI_valid_i),
    .tcsh_i(PI_tcsh_i),
    .sel_i(PI_sel_i),
    .hb_dq_i(PI_hb_dq_i),
    .fixed_latency_i(PI_fixed_latency_i),
    .double_latency_i(PI_double_latency_i),
    .addr_i(PI_addr_i)
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
    // UUT.$and$hyperram.\v:0$1472_Y  = 1'b0;
    // UUT.$and$hyperram.\v:0$823_Y  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3689  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3699  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3709  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3719  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3729  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3739  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3749  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3759  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3769  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3779  = 5'b00001;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3789  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3799  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3809  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3819  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3829  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3839  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3849  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3859  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3869  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3879  = 6'b100000;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3691  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3741  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3695  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3705  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3715  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3725  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3735  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3745  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3755  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3765  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3775  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3785  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3795  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3805  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3815  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3825  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3835  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3845  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3855  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3865  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3875  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3885  = 6'b000000;
    // UUT.$formal$hyperram.\v:1001$288_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1001$288_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1004$289_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1004$289_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$290_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$290_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1012$291_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$292_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$292_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1018$293_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1018$293_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1021$294_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1021$294_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1024$295_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1024$295_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1029$296_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$297_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$297_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1035$298_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1035$298_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$299_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$299_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1047$301_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1047$301_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1052$302_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1052$302_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1055$303_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1055$303_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1056$304_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1056$304_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$305_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$305_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1058$306_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1058$306_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1066$307_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1066$307_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1067$308_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1068$309_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1069$310_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:395$205_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:395$205_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:398$206_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:398$206_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:405$207_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:408$208_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:411$209_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:414$210_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:417$211_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:423$212_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:438$213_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:455$214_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:475$215_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:495$216_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:517$217_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:533$218_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:552$219_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:573$220_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:593$221_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:615$222_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:631$223_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:648$224_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:668$225_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:688$226_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:709$227_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:726$228_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:745$229_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:761$230_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:777$231_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:796$232_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:813$233_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:831$234_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:848$235_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:848$235_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:854$236_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:855$237_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:861$238_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:861$238_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:862$239_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:863$240_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:866$241_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:866$241_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:868$242_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:868$242_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:871$243_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:871$243_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:873$244_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:873$244_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:873$245_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:875$246_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:883$247_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:883$247_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:885$248_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:885$248_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:889$249_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$249_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:890$250_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:890$250_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:891$251_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:891$251_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:892$252_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:892$252_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:893$253_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:893$253_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:894$254_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:894$254_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:900$255_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:900$255_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:901$256_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:901$256_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:902$257_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:902$257_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:903$258_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:903$258_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:911$259_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:911$259_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:913$260_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:913$260_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:917$261_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:917$261_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:919$262_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:919$262_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:926$263_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:926$263_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:927$264_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:928$265_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:929$266_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:931$267_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:931$267_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:937$268_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:937$268_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:941$269_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:941$269_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:944$270_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:944$270_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:947$271_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:947$271_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:950$272_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:950$272_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:953$273_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:953$273_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:956$274_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:956$274_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:959$275_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:959$275_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:962$276_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:962$276_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:965$277_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:965$277_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:968$278_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:968$278_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:974$279_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:974$279_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:977$280_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:977$280_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:980$281_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:980$281_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:983$282_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:983$282_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:987$283_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:987$283_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:989$284_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:989$284_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:993$285_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:993$285_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:995$286_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:995$286_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:997$287_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:997$287_EN  = 1'b0;
    // UUT.$past$hyperram.\v:1014$170$0  = 1'b0;
    // UUT.$past$hyperram.\v:1014$171$0  = 1'b0;
    // UUT.$past$hyperram.\v:1046$182$0  = 1'b0;
    // UUT.$past$hyperram.\v:1046$183$0  = 1'b0;
    // UUT.$past$hyperram.\v:1051$187$0  = 8'b00000000;
    // UUT.$past$hyperram.\v:1066$197$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$hyperram.\v:1067$198$0  = 4'b0000;
    // UUT.$past$hyperram.\v:1068$199$0  = 1'b0;
    // UUT.$past$hyperram.\v:1069$200$0  = 1'b0;
    // UUT.$past$hyperram.\v:429$6$0  = 1'b0;
    // UUT.$past$hyperram.\v:861$119$0  = 4'b0000;
    // UUT.$past$hyperram.\v:862$120$0  = 4'b0000;
    // UUT.$past$hyperram.\v:863$121$0  = 4'b0000;
    // UUT.$past$hyperram.\v:865$122$0  = 5'b00000;
    // UUT.$past$hyperram.\v:870$124$0  = 4'b0000;
    // UUT.$past$hyperram.\v:875$126$0  = 1'b0;
    // UUT.$past$hyperram.\v:876$127$0  = 1'b0;
    UUT.f_past_valid = 1'b0;

    // state 0
    PI_tpost_i = 4'b0000;
    PI_trmax_i = 5'b00000;
    PI_rst_i = 1'b1;
    PI_wren_i = 1'b0;
    PI_hb_rwds_i = 1'b0;
    PI_tpre_i = 4'b0000;
    PI_tacc_i = 4'b0000;
    PI_regspace_i = 1'b0;
    PI_clk_i = 1'b0;
    PI_data_i = 32'b00000000000000000000000000000000;
    PI_valid_i = 1'b0;
    PI_tcsh_i = 4'b0000;
    PI_sel_i = 4'b0000;
    PI_hb_dq_i = 8'b00000000;
    PI_fixed_latency_i = 1'b0;
    PI_double_latency_i = 1'b0;
    PI_addr_i = 32'b00000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b1;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_tpost_i <= 4'b0011;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0110;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 8
    if (cycle == 7) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b01111000000100100011010001010110;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b1010;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b10000000000000000000000000000100;
    end

    // state 9
    if (cycle == 8) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 10
    if (cycle == 9) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b11111;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0010;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 11
    if (cycle == 10) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 12
    if (cycle == 11) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b10001;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b1000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 13
    if (cycle == 12) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 14
    if (cycle == 13) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 15
    if (cycle == 14) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 16
    if (cycle == 15) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0110;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0010;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 17
    if (cycle == 16) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01111100;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 18
    if (cycle == 17) begin
      PI_tpost_i <= 4'b0010;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0110;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 19
    if (cycle == 18) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01111100;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 20
    if (cycle == 19) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b1000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0011;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 21
    if (cycle == 20) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 22
    if (cycle == 21) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 23
    if (cycle == 22) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 24
    if (cycle == 23) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0100;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 25
    if (cycle == 24) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b11111001;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 26
    if (cycle == 25) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 27
    if (cycle == 26) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01111100;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 28
    if (cycle == 27) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0100;
      PI_tacc_i <= 4'b0100;
      PI_regspace_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 29
    if (cycle == 28) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 30
    if (cycle == 29) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0110;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b01111000000100100011010001010110;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b1010;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 31
    if (cycle == 30) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 32
    if (cycle == 31) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0001;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 33
    if (cycle == 32) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b11111001;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 34
    if (cycle == 33) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 35
    if (cycle == 34) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01111100;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 36
    if (cycle == 35) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 37
    if (cycle == 36) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b01111100;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 38
    if (cycle == 37) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0100;
      PI_regspace_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b1;
      PI_tcsh_i <= 4'b0101;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 39
    if (cycle == 38) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    // state 40
    if (cycle == 39) begin
      PI_tpost_i <= 4'b0000;
      PI_trmax_i <= 5'b00000;
      PI_rst_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_valid_i <= 1'b0;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
    end

    genclock <= cycle < 40;
    cycle <= cycle + 1;
  end
endmodule
