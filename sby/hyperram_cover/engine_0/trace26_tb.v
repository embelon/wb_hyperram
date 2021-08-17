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
  reg [0:0] PI_regspace_i;
  reg [0:0] PI_hb_rwds_i;
  reg [0:0] PI_fixed_latency_i;
  reg [0:0] PI_clk_i;
  reg [4:0] PI_trmax_i;
  reg [3:0] PI_tpre_i;
  reg [0:0] PI_rst_i;
  reg [3:0] PI_tacc_i;
  reg [3:0] PI_tpost_i;
  reg [7:0] PI_hb_dq_i;
  reg [0:0] PI_wren_i;
  reg [0:0] PI_valid_i;
  reg [31:0] PI_addr_i;
  reg [3:0] PI_tcsh_i;
  reg [3:0] PI_sel_i;
  reg [0:0] PI_double_latency_i;
  reg [31:0] PI_data_i;
  hyperram UUT (
    .regspace_i(PI_regspace_i),
    .hb_rwds_i(PI_hb_rwds_i),
    .fixed_latency_i(PI_fixed_latency_i),
    .clk_i(PI_clk_i),
    .trmax_i(PI_trmax_i),
    .tpre_i(PI_tpre_i),
    .rst_i(PI_rst_i),
    .tacc_i(PI_tacc_i),
    .tpost_i(PI_tpost_i),
    .hb_dq_i(PI_hb_dq_i),
    .wren_i(PI_wren_i),
    .valid_i(PI_valid_i),
    .addr_i(PI_addr_i),
    .tcsh_i(PI_tcsh_i),
    .sel_i(PI_sel_i),
    .double_latency_i(PI_double_latency_i),
    .data_i(PI_data_i)
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
    // UUT.$and$hyperram.\v:0$1431_Y  = 1'b0;
    // UUT.$and$hyperram.\v:0$786_Y  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3469  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3479  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3489  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3499  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3509  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3519  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3529  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3539  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3549  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3559  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3569  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3579  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3589  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3599  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3609  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3619  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3629  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3639  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3649  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:156:execute$3659  = 6'b100000;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3471  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:168:execute$3521  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3475  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3485  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3495  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3505  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3515  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3525  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3535  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3545  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3555  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3565  = 5'b00000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3575  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3585  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3595  = 32'b00000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3605  = 48'b000000000000000000000000000000000000000000000000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3615  = 4'b0000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3625  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3635  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3645  = 3'b000;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3655  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:192:execute$3665  = 6'b000000;
    // UUT.$formal$hyperram.\v:1000$269_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1000$269_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1003$270_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1003$270_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1006$271_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1006$271_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1010$272_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1010$272_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1012$273_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1012$273_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1016$274_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1016$274_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1018$275_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1018$275_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1020$276_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1020$276_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1024$277_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1024$277_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1027$278_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1027$278_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1030$279_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1030$279_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1036$280_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$281_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1039$281_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$282_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1042$282_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1045$283_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1045$283_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1048$284_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1048$284_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1053$285_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$286_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1057$286_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1059$287_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1059$287_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1072$289_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1072$289_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1084$290_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1084$290_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1085$291_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1085$291_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1086$292_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1086$292_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1087$293_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1087$293_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1095$294_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1095$294_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:1096$295_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1097$296_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:1098$297_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$199_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:402$199_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:405$200_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:405$200_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:412$201_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:415$202_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:418$203_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:421$204_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:424$205_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:430$206_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:445$207_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:462$208_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:482$209_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:502$210_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:524$211_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:540$212_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:559$213_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:580$214_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:600$215_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:622$216_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:638$217_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:655$218_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:675$219_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:695$220_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:716$221_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:733$222_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:752$223_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:768$224_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:784$225_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:803$226_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:820$227_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:838$228_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$229_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:854$229_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:860$230_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:861$231_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$232_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:867$232_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:868$233_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:869$234_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$235_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:872$235_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:874$236_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:874$236_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:877$237_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:877$237_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$238_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:879$238_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:879$239_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:881$240_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$241_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:889$241_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:891$242_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:891$242_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:893$243_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:893$243_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:907$244_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:907$244_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:923$245_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:923$245_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:925$246_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:925$246_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:929$247_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:929$247_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:931$248_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:931$248_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:937$249_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:937$249_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:939$250_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:939$250_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:944$251_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:944$251_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:945$252_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:946$253_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:947$254_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$255_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:949$255_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:955$256_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:955$256_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:959$257_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:959$257_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:962$258_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:962$258_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:965$259_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:965$259_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:968$260_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:968$260_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:972$261_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:972$261_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:974$262_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:974$262_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:978$263_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:978$263_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:981$264_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:981$264_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:984$265_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:984$265_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:987$266_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:987$266_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:990$267_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:990$267_EN  = 1'b0;
    // UUT.$formal$hyperram.\v:997$268_CHECK  = 1'b0;
    // UUT.$formal$hyperram.\v:997$268_EN  = 1'b0;
    // UUT.$past$hyperram.\v:1038$170$0  = 1'b0;
    // UUT.$past$hyperram.\v:1038$171$0  = 1'b0;
    // UUT.$past$hyperram.\v:1071$180$0  = 1'b0;
    // UUT.$past$hyperram.\v:1078$181$0  = 1'b0;
    // UUT.$past$hyperram.\v:1084$183$0  = 8'b00000000;
    // UUT.$past$hyperram.\v:1095$191$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$hyperram.\v:1096$192$0  = 4'b0000;
    // UUT.$past$hyperram.\v:1097$193$0  = 1'b0;
    // UUT.$past$hyperram.\v:1098$194$0  = 1'b0;
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
    PI_regspace_i = 1'b0;
    PI_hb_rwds_i = 1'b0;
    PI_fixed_latency_i = 1'b0;
    PI_clk_i = 1'b0;
    PI_trmax_i = 5'b00000;
    PI_tpre_i = 4'b0000;
    PI_rst_i = 1'b1;
    PI_tacc_i = 4'b0000;
    PI_tpost_i = 4'b0000;
    PI_hb_dq_i = 8'b00000000;
    PI_wren_i = 1'b0;
    PI_valid_i = 1'b0;
    PI_addr_i = 32'b00000000000000000000000000000000;
    PI_tcsh_i = 4'b0000;
    PI_sel_i = 4'b0000;
    PI_double_latency_i = 1'b0;
    PI_data_i = 32'b00000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b1;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 8
    if (cycle == 7) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 9
    if (cycle == 8) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 10
    if (cycle == 9) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b10000000000000000000000000000100;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 11
    if (cycle == 10) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 12
    if (cycle == 11) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11001;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 13
    if (cycle == 12) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 14
    if (cycle == 13) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10100;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 15
    if (cycle == 14) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 16
    if (cycle == 15) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 17
    if (cycle == 16) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 18
    if (cycle == 17) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 19
    if (cycle == 18) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 20
    if (cycle == 19) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0100;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 21
    if (cycle == 20) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 22
    if (cycle == 21) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 23
    if (cycle == 22) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 24
    if (cycle == 23) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 25
    if (cycle == 24) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 26
    if (cycle == 25) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00101;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b1000;
      PI_tpost_i <= 4'b0111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0001;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 27
    if (cycle == 26) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 28
    if (cycle == 27) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 29
    if (cycle == 28) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 30
    if (cycle == 29) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 31
    if (cycle == 30) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 32
    if (cycle == 31) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 33
    if (cycle == 32) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 34
    if (cycle == 33) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 35
    if (cycle == 34) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 36
    if (cycle == 35) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 37
    if (cycle == 36) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 38
    if (cycle == 37) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0100;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 39
    if (cycle == 38) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 40
    if (cycle == 39) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0101;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 41
    if (cycle == 40) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 42
    if (cycle == 41) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0101;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 43
    if (cycle == 42) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 44
    if (cycle == 43) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0010;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 45
    if (cycle == 44) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 46
    if (cycle == 45) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 47
    if (cycle == 46) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 48
    if (cycle == 47) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 49
    if (cycle == 48) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 50
    if (cycle == 49) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 51
    if (cycle == 50) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 52
    if (cycle == 51) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0010;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 53
    if (cycle == 52) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 54
    if (cycle == 53) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 55
    if (cycle == 54) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 56
    if (cycle == 55) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 57
    if (cycle == 56) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 58
    if (cycle == 57) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0101;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 59
    if (cycle == 58) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 60
    if (cycle == 59) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 61
    if (cycle == 60) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 62
    if (cycle == 61) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 63
    if (cycle == 62) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 64
    if (cycle == 63) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 65
    if (cycle == 64) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 66
    if (cycle == 65) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0100;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b1001;
      PI_tpost_i <= 4'b0111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 67
    if (cycle == 66) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 68
    if (cycle == 67) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1011;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 69
    if (cycle == 68) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 70
    if (cycle == 69) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 71
    if (cycle == 70) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 72
    if (cycle == 71) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1011;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 73
    if (cycle == 72) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 74
    if (cycle == 73) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 75
    if (cycle == 74) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 76
    if (cycle == 75) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 77
    if (cycle == 76) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 78
    if (cycle == 77) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 79
    if (cycle == 78) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 80
    if (cycle == 79) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 81
    if (cycle == 80) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 82
    if (cycle == 81) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1011;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 83
    if (cycle == 82) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 84
    if (cycle == 83) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11011;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b1000;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0110;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 85
    if (cycle == 84) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 86
    if (cycle == 85) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11011;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0100;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0110;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 87
    if (cycle == 86) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 88
    if (cycle == 87) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 89
    if (cycle == 88) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 90
    if (cycle == 89) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1100;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 91
    if (cycle == 90) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 92
    if (cycle == 91) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0011;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 93
    if (cycle == 92) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 94
    if (cycle == 93) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 95
    if (cycle == 94) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 96
    if (cycle == 95) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0100;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 97
    if (cycle == 96) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 98
    if (cycle == 97) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 99
    if (cycle == 98) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 100
    if (cycle == 99) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 101
    if (cycle == 100) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 102
    if (cycle == 101) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 103
    if (cycle == 102) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 104
    if (cycle == 103) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 105
    if (cycle == 104) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 106
    if (cycle == 105) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 107
    if (cycle == 106) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 108
    if (cycle == 107) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 109
    if (cycle == 108) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 110
    if (cycle == 109) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 111
    if (cycle == 110) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 112
    if (cycle == 111) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1110;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 113
    if (cycle == 112) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 114
    if (cycle == 113) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11011;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1110;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 115
    if (cycle == 114) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 116
    if (cycle == 115) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b1;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 117
    if (cycle == 116) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 118
    if (cycle == 117) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 119
    if (cycle == 118) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 120
    if (cycle == 119) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0001;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 121
    if (cycle == 120) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 122
    if (cycle == 121) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1110;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 123
    if (cycle == 122) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 124
    if (cycle == 123) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0101;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 125
    if (cycle == 124) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 126
    if (cycle == 125) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 127
    if (cycle == 126) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 128
    if (cycle == 127) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10010;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 129
    if (cycle == 128) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 130
    if (cycle == 129) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1111;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b1111;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 131
    if (cycle == 130) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 132
    if (cycle == 131) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 133
    if (cycle == 132) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 134
    if (cycle == 133) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 135
    if (cycle == 134) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 136
    if (cycle == 135) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0001;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 137
    if (cycle == 136) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 138
    if (cycle == 137) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b1100;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 139
    if (cycle == 138) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 140
    if (cycle == 139) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0110;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 141
    if (cycle == 140) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 142
    if (cycle == 141) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b1;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b11111;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0100;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b1;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 143
    if (cycle == 142) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 144
    if (cycle == 143) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 145
    if (cycle == 144) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 146
    if (cycle == 145) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10001;
      PI_tpre_i <= 4'b1111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b1000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 147
    if (cycle == 146) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 148
    if (cycle == 147) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 149
    if (cycle == 148) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 150
    if (cycle == 149) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 151
    if (cycle == 150) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 152
    if (cycle == 151) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b10010;
      PI_tpre_i <= 4'b0011;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0010;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 153
    if (cycle == 152) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 154
    if (cycle == 153) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 155
    if (cycle == 154) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 156
    if (cycle == 155) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 157
    if (cycle == 156) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 158
    if (cycle == 157) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 159
    if (cycle == 158) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 160
    if (cycle == 159) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 161
    if (cycle == 160) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 162
    if (cycle == 161) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 163
    if (cycle == 162) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 164
    if (cycle == 163) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b01000;
      PI_tpre_i <= 4'b0110;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 165
    if (cycle == 164) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 166
    if (cycle == 165) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b1100;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 167
    if (cycle == 166) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 168
    if (cycle == 167) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0010;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b1;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 169
    if (cycle == 168) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 170
    if (cycle == 169) begin
      PI_regspace_i <= 1'b1;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 171
    if (cycle == 170) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 172
    if (cycle == 171) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0111;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 173
    if (cycle == 172) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 174
    if (cycle == 173) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 175
    if (cycle == 174) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b1;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 176
    if (cycle == 175) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 177
    if (cycle == 176) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 178
    if (cycle == 177) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 179
    if (cycle == 178) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b1;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    // state 180
    if (cycle == 179) begin
      PI_regspace_i <= 1'b0;
      PI_hb_rwds_i <= 1'b0;
      PI_fixed_latency_i <= 1'b0;
      PI_clk_i <= 1'b0;
      PI_trmax_i <= 5'b00000;
      PI_tpre_i <= 4'b0000;
      PI_rst_i <= 1'b0;
      PI_tacc_i <= 4'b0000;
      PI_tpost_i <= 4'b0000;
      PI_hb_dq_i <= 8'b00000000;
      PI_wren_i <= 1'b0;
      PI_valid_i <= 1'b0;
      PI_addr_i <= 32'b00000000000000000000000000000000;
      PI_tcsh_i <= 4'b0000;
      PI_sel_i <= 4'b0000;
      PI_double_latency_i <= 1'b0;
      PI_data_i <= 32'b00000000000000000000000000000000;
    end

    genclock <= cycle < 180;
    cycle <= cycle + 1;
  end
endmodule
