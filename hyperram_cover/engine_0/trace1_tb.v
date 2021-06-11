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
  reg [0:0] PI_rst_i;
  reg [0:0] PI_fixed_latency_i;
  reg [7:0] PI_hb_dq_i;
  reg [0:0] PI_double_latency_i;
  reg [0:0] PI_wren_i;
  reg [3:0] PI_tpre_i;
  reg [3:0] PI_sel_i;
  reg [31:0] PI_addr_i;
  reg [3:0] PI_tpost_i;
  reg [3:0] PI_tacc_i;
  reg [0:0] PI_valid_i;
  reg [0:0] PI_regspace_i;
  reg [4:0] PI_trmax_i;
  reg [0:0] PI_clk_i;
  reg [0:0] PI_hb_rwds_i;
  reg [31:0] PI_data_i;
  reg [3:0] PI_tcsh_i;
  hyperram UUT (
    .rst_i(PI_rst_i),
    .fixed_latency_i(PI_fixed_latency_i),
    .hb_dq_i(PI_hb_dq_i),
    .double_latency_i(PI_double_latency_i),
    .wren_i(PI_wren_i),
    .tpre_i(PI_tpre_i),
    .sel_i(PI_sel_i),
    .addr_i(PI_addr_i),
    .tpost_i(PI_tpost_i),
    .tacc_i(PI_tacc_i),
    .valid_i(PI_valid_i),
    .regspace_i(PI_regspace_i),
    .trmax_i(PI_trmax_i),
    .clk_i(PI_clk_i),
    .hb_rwds_i(PI_hb_rwds_i),
    .data_i(PI_data_i),
    .tcsh_i(PI_tcsh_i)
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
    // UUT.$and$hyperram.\v:0$1445_Y  = 1'b0;
    // UUT.$and$hyperram.\v:0$799_Y  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3504  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3514  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3524  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3534  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3544  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3554  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3564  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3574  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3584  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3594  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3604  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3614  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3624  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3634  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3644  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3654  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3664  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3674  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3684  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3694  = 6'b100000;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3506  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3556  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3510  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3520  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3530  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3540  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3550  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3560  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3570  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3580  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3590  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3600  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3610  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3620  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3630  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3640  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3650  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3660  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3670  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3680  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3690  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3700  = 6'b000000;
    // UUT.$formal$hyperram.\v:1001$275_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1001$275_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1005$276_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1005$276_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$277_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1007$277_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1011$278_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1011$278_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1013$279_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1013$279_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$280_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1015$280_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1019$281_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1019$281_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1022$282_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1022$282_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1025$283_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1025$283_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1030$284_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$285_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1033$285_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1036$286_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1036$286_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$287_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$287_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$288_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$288_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1047$289_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1051$290_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1051$290_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1053$291_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1053$291_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$292_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$292_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1065$294_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1065$294_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1068$295_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1068$295_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1077$296_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1077$296_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1078$297_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1078$297_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1079$298_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1079$298_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1080$299_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1080$299_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1088$300_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1088$300_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1089$301_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1090$302_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1091$303_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$204_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$204_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:405$205_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:405$205_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:412$206_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:415$207_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:418$208_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:421$209_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:424$210_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:430$211_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:445$212_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:462$213_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:482$214_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:502$215_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:524$216_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:540$217_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:559$218_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:580$219_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:600$220_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:622$221_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:638$222_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:655$223_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:675$224_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:695$225_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:716$226_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:733$227_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:752$228_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:768$229_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:784$230_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:803$231_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:820$232_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:838$233_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$234_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$234_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:860$235_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:861$236_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$237_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$237_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:868$238_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:869$239_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$240_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$240_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:874$241_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:874$241_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:877$242_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:877$242_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$243_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:879$243_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$244_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:881$245_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$246_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$246_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:891$247_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:891$247_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:893$248_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:893$248_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:907$249_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:907$249_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:923$250_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:923$250_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:925$251_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:925$251_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:929$252_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:929$252_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:931$253_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:931$253_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:937$254_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:937$254_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:939$255_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:939$255_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:944$256_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:944$256_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:945$257_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:946$258_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:947$259_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$260_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$260_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:955$261_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:955$261_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:959$262_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:959$262_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:962$263_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:962$263_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:965$264_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:965$264_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:968$265_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:968$265_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:971$266_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:971$266_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:974$267_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:974$267_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:977$268_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:977$268_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:980$269_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:980$269_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:983$270_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:983$270_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:986$271_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:986$271_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:992$272_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:992$272_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:995$273_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:995$273_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:998$274_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:998$274_EN  = 1'b0;
    // UUT.$past$hyperram.\v:1032$170$0  = 1'b0;
    // UUT.$past$hyperram.\v:1032$171$0  = 1'b0;
    // UUT.$past$hyperram.\v:1064$181$0  = 1'b0;
    // UUT.$past$hyperram.\v:1067$183$0  = 1'b0;
    // UUT.$past$hyperram.\v:1067$184$0  = 1'b0;
    // UUT.$past$hyperram.\v:1077$188$0  = 8'b00000000;
    // UUT.$past$hyperram.\v:1088$196$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$hyperram.\v:1089$197$0  = 4'b0000;
    // UUT.$past$hyperram.\v:1090$198$0  = 1'b0;
    // UUT.$past$hyperram.\v:1091$199$0  = 1'b0;
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
    PI_rst_i = 1'b1;
    PI_fixed_latency_i = 1'b0;
    PI_hb_dq_i = 8'b00000000;
    PI_double_latency_i = 1'b0;
    PI_wren_i = 1'b0;
    PI_tpre_i = 4'b0000;
    PI_sel_i = 4'b0000;
    PI_addr_i = 32'b00000000000000000000000000000000;
    PI_tpost_i = 4'b0000;
    PI_tacc_i = 4'b0000;
    PI_valid_i = 1'b0;
    PI_regspace_i = 1'b0;
    PI_trmax_i = 5'b00000;
    PI_clk_i = 1'b0;
    PI_hb_rwds_i = 1'b0;
    PI_data_i = 32'b00000000000000000000000000000000;
    PI_tcsh_i = 4'b0000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 4
    if (cycle == 3) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 5
    if (cycle == 4) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 6
    if (cycle == 5) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 7
    if (cycle == 6) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 8
    if (cycle == 7) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 9
    if (cycle == 8) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 10
    if (cycle == 9) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b1100;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0100;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b1;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 11
    if (cycle == 10) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    // state 12
    if (cycle == 11) begin
      PI_rst_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_hb_dq_i <= 8'b00000000;
      PI_double_latency_i <= 1'b0;
      PI_wren_i <= 1'b0;
      PI_tpre_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tpost_i <= 4'b0000;
      PI_tacc_i <= 4'b0000;
      PI_valid_i <= 1'b0;
      PI_regspace_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_clk_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
    end

    genclock <= cycle < 12;
    cycle <= cycle + 1;
  end
endmodule
