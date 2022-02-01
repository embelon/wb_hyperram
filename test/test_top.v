`default_nettype none
`timescale 1ps/1ps
module test_top (
	input		wb_clk_i,
	input		wb_rst_i,
	
	input		wbs_stb_i,
	input		wbs_cyc_i,
	input		wbs_we_i,
	input	[3:0] 	wbs_sel_i,
	input 	[31:0] 	wbs_dat_i,
	input	[31:0] 	wbs_adr_i,
	output		wbs_ack_o,
	output	[31:0] 	wbs_dat_o,	

	input		rst_i
);

    wire [7:0] HB_DQ;
    wire HB_RWDS;
    wire HB_CSN;
    wire HB_CLK;
    wire HB_CLKN;
    wire HB_RSTN;

    s27kl0641 
    #(
	.UserPreload(1)
    )
    hyperram_mem
    (
        .DQ7        (HB_DQ[7]),
        .DQ6        (HB_DQ[6]),
        .DQ5        (HB_DQ[5]),
        .DQ4        (HB_DQ[4]),
        .DQ3        (HB_DQ[3]),
        .DQ2        (HB_DQ[2]),
        .DQ1        (HB_DQ[1]),
        .DQ0        (HB_DQ[0]),
        .RWDS       (HB_RWDS),

        .CSNeg      (HB_CSN),
        .CK         (HB_CLK),
        .RESETNeg   (HB_RSTN)
    );

    wire [7:0] hb_dq_o;
    wire [7:0] hb_dq_oen;
    wire hb_rwds_o, hb_rwds_oen;

    wb_hyperram hyperram_drv (
        .wb_clk_i       (wb_clk_i),
        .wb_rst_i       (wb_rst_i),
        
        .wbs_stb_i      (wbs_stb_i),
        .wbs_cyc_i      (wbs_cyc_i),
        .wbs_we_i       (wbs_we_i),
        .wbs_sel_i      (wbs_sel_i[3:0]),
        .wbs_dat_i      (wbs_dat_i[31:0]),
        .wbs_adr_i     	(wbs_adr_i[31:0]),
        .wbs_ack_o      (wbs_ack_o),
        .wbs_dat_o      (wbs_dat_o[31:0]),	

        .rst_i,

        .hb_rstn_o      (HB_RSTN),	    	// #RST
        .hb_csn_o       (HB_CSN),	    	// #CS
        .hb_clk_o       (HB_CLK),
        .hb_clkn_o      (),             	// #CLK
        .hb_rwds_o      (hb_rwds_o),
        .hb_rwds_oen    (hb_rwds_oen),		// #RWDS_OE
        .hb_dq_o        (hb_dq_o[7:0]),
        .hb_dq_oen      (hb_dq_oen[7:0]),    	// #DQ_OE
        .hb_rwds_i      (HB_RWDS),
        .hb_dq_i        (HB_DQ[7:0])
    );
    
    assign HB_RWDS = hb_rwds_oen ? 1'bZ : hb_rwds_o;
    assign HB_DQ[7:0] = hb_dq_oen[0] ? 8'bZZZZZZZZ : hb_dq_o[7:0];

endmodule
