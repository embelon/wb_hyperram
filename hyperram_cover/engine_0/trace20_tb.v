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
  reg [0:0] PI_hb_rwds_i;
  reg [0:0] PI_valid_i;
  reg [7:0] PI_hb_dq_i;
  reg [0:0] PI_wren_i;
  reg [3:0] PI_sel_i;
  reg [0:0] PI_clk_i;
  reg [4:0] PI_trmax_i;
  reg [31:0] PI_addr_i;
  reg [3:0] PI_tacc_i;
  reg [3:0] PI_tcsh_i;
  reg [0:0] PI_regspace_i;
  reg [3:0] PI_tpre_i;
  reg [0:0] PI_rst_i;
  reg [0:0] PI_fixed_latency_i;
  reg [0:0] PI_double_latency_i;
  reg [31:0] PI_data_i;
  reg [3:0] PI_tpost_i;
  hyperram UUT (
    .hb_rwds_i(PI_hb_rwds_i),
    .valid_i(PI_valid_i),
    .hb_dq_i(PI_hb_dq_i),
    .wren_i(PI_wren_i),
    .sel_i(PI_sel_i),
    .clk_i(PI_clk_i),
    .trmax_i(PI_trmax_i),
    .addr_i(PI_addr_i),
    .tacc_i(PI_tacc_i),
    .tcsh_i(PI_tcsh_i),
    .regspace_i(PI_regspace_i),
    .tpre_i(PI_tpre_i),
    .rst_i(PI_rst_i),
    .fixed_latency_i(PI_fixed_latency_i),
    .double_latency_i(PI_double_latency_i),
    .data_i(PI_data_i),
    .tpost_i(PI_tpost_i)
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
    // UUT.$and$hyperram.\v:0$1448_Y  = 1'b0;
    // UUT.$and$hyperram.\v:0$802_Y  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3510  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3520  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3530  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3540  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3550  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3560  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3570  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3580  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3590  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3600  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3610  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3620  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3630  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3640  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3650  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3660  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3670  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3680  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3690  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3700  = 6'b100000;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3512  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3562  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3516  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3526  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3536  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3546  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3556  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3566  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3576  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3586  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3596  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3606  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3616  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3626  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3636  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3646  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3656  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3666  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3676  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3686  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3696  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3706  = 6'b000000;
    // UUT.$formal$hyperram.\v:1001$276_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1001$276_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1005$277_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1005$277_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$278_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$278_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1011$279_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1011$279_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1013$280_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1013$280_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$281_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$281_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1019$282_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1019$282_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1022$283_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1022$283_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1025$284_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1025$284_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1030$285_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$286_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$286_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1036$287_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1036$287_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$288_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$288_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$289_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$289_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1047$290_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1051$291_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1051$291_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1053$292_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1053$292_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$293_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$293_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1065$295_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1065$295_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1070$296_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1070$296_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1073$297_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1073$297_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1074$298_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1074$298_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1075$299_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1075$299_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1076$300_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1076$300_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1084$301_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1084$301_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1085$302_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1086$303_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1087$304_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$205_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$205_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:405$206_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:405$206_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:412$207_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:415$208_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:418$209_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:421$210_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:424$211_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:430$212_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:445$213_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:462$214_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:482$215_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:502$216_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:524$217_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:540$218_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:559$219_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:580$220_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:600$221_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:622$222_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:638$223_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:655$224_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:675$225_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:695$226_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:716$227_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:733$228_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:752$229_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:768$230_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:784$231_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:803$232_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:820$233_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:838$234_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$235_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$235_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:860$236_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:861$237_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$238_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$238_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:868$239_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:869$240_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$241_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$241_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:874$242_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:874$242_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:877$243_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:877$243_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$244_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:879$244_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$245_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:881$246_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$247_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$247_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:891$248_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:891$248_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:893$249_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:893$249_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:907$250_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:907$250_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:923$251_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:923$251_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:925$252_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:925$252_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:929$253_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:929$253_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:931$254_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:931$254_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:937$255_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:937$255_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:939$256_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:939$256_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:944$257_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:944$257_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:945$258_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:946$259_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:947$260_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$261_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$261_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:955$262_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:955$262_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:959$263_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:959$263_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:962$264_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:962$264_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:965$265_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:965$265_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:968$266_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:968$266_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:971$267_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:971$267_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:974$268_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:974$268_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:977$269_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:977$269_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:980$270_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:980$270_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:983$271_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:983$271_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:986$272_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:986$272_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:992$273_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:992$273_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:995$274_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:995$274_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:998$275_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:998$275_EN  = 1'b0;
    // UUT.$past$hyperram.\v:1032$170$0  = 1'b0;
    // UUT.$past$hyperram.\v:1032$171$0  = 1'b0;
    // UUT.$past$hyperram.\v:1064$182$0  = 1'b0;
    // UUT.$past$hyperram.\v:1064$183$0  = 1'b0;
    // UUT.$past$hyperram.\v:1069$187$0  = 8'b00000000;
    // UUT.$past$hyperram.\v:1084$197$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$hyperram.\v:1085$198$0  = 4'b0000;
    // UUT.$past$hyperram.\v:1086$199$0  = 1'b0;
    // UUT.$past$hyperram.\v:1087$200$0  = 1'b0;
    // UUT.$past$hyperram.\v:436$6$0  = 1'b0;
    // UUT.$past$hyperram.\v:867$119$0  = 4'b0000;
    // UUT.$past$hyperram.\v:868$120$0  = 4'b0000;
    // UUT.$past$hyperram.\v:869$121$0  = 4'b0000;
    // UUT.$past$hyperram.\v:871$122$0  = 5'b00000;
    // UUT.$past$hyperram.\v:876$124$0  = 4'b0000;
    // UUT.$past$hyperram.\v:881$126$0  = 1'b0;
    // UUT.$past$hyperram.\v:882$127$0  = 1'b0;
    UUT.f_past_valid = 1'b0;

    // state 0
    PI_hb_rwds_i = 1'b0;
    PI_valid_i = 1'b0;
    PI_hb_dq_i = 8'b00000000;
    PI_wren_i = 1'b0;
    PI_sel_i = 4'b0000;
    PI_clk_i = 1'b0;
    PI_trmax_i = 5'b00000;
    PI_addr_i = 32'b00000000000000000000000000000000;
    PI_tacc_i = 4'b0000;
    PI_tcsh_i = 4'b0000;
    PI_regspace_i = 1'b0;
    PI_tpre_i = 4'b0000;
    PI_rst_i = 1'b1;
    PI_fixed_latency_i = 1'b0;
    PI_double_latency_i = 1'b0;
    PI_data_i = 32'b00000000000000000000000000000000;
    PI_tpost_i = 4'b0000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 2
    if (cycle == 1) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 3
    if (cycle == 2) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 4
    if (cycle == 3) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 5
    if (cycle == 4) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 6
    if (cycle == 5) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 7
    if (cycle == 6) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 8
    if (cycle == 7) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b1010;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b10000000000000000000000000000100;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b01111000000100100011010001010110;
      PI_tpost_i <= 4'b0000;
    end

    // state 9
    if (cycle == 8) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 10
    if (cycle == 9) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10100;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b1011;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 11
    if (cycle == 10) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 12
    if (cycle == 11) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0011;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 13
    if (cycle == 12) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 14
    if (cycle == 13) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 15
    if (cycle == 14) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 16
    if (cycle == 15) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 17
    if (cycle == 16) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 18
    if (cycle == 17) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0011;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 19
    if (cycle == 18) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11111010;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 20
    if (cycle == 19) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10100;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0010;
    end

    // state 21
    if (cycle == 20) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 22
    if (cycle == 21) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10101;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0001;
    end

    // state 23
    if (cycle == 22) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11111110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 24
    if (cycle == 23) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00110;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 25
    if (cycle == 24) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 26
    if (cycle == 25) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10011;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 27
    if (cycle == 26) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 28
    if (cycle == 27) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b1000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10011;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0011;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b1110;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 29
    if (cycle == 28) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 30
    if (cycle == 29) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b1101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0101;
    end

    // state 31
    if (cycle == 30) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 32
    if (cycle == 31) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10100;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0111;
    end

    // state 33
    if (cycle == 32) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 34
    if (cycle == 33) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0100;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b1101;
    end

    // state 35
    if (cycle == 34) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 36
    if (cycle == 35) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11010;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0100;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 37
    if (cycle == 36) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 38
    if (cycle == 37) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10010;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 39
    if (cycle == 38) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 40
    if (cycle == 39) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 41
    if (cycle == 40) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 42
    if (cycle == 41) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 43
    if (cycle == 42) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01000010;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 44
    if (cycle == 43) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0101;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 45
    if (cycle == 44) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 46
    if (cycle == 45) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0101;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 47
    if (cycle == 46) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 48
    if (cycle == 47) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 49
    if (cycle == 48) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 50
    if (cycle == 49) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 51
    if (cycle == 50) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 52
    if (cycle == 51) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0101;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0101;
    end

    // state 53
    if (cycle == 52) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01111010;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 54
    if (cycle == 53) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0111;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 55
    if (cycle == 54) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 56
    if (cycle == 55) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 57
    if (cycle == 56) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00111000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 58
    if (cycle == 57) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0111;
    end

    // state 59
    if (cycle == 58) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11111010;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 60
    if (cycle == 59) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 61
    if (cycle == 60) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 62
    if (cycle == 61) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0010;
    end

    // state 63
    if (cycle == 62) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00110100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 64
    if (cycle == 63) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0011;
    end

    // state 65
    if (cycle == 64) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01010110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 66
    if (cycle == 65) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 67
    if (cycle == 66) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11000010;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 68
    if (cycle == 67) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_sel_i <= 4'b1010;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0100;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b1;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b01111000000100100011010001010110;
      PI_tpost_i <= 4'b1111;
    end

    // state 69
    if (cycle == 68) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b10111100;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 70
    if (cycle == 69) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 71
    if (cycle == 70) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b01010110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 72
    if (cycle == 71) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 73
    if (cycle == 72) begin
      PI_hb_rwds_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b11111110;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 74
    if (cycle == 73) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 75
    if (cycle == 74) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    // state 76
    if (cycle == 75) begin
      PI_hb_rwds_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_sel_i <= 4'b0000;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tacc_i <= 4'b0000;
      PI_tcsh_i <= 4'b0000;
      PI_regspace_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
    end

    genclock <= cycle < 76;
    cycle <= cycle + 1;
  end
endmodule
