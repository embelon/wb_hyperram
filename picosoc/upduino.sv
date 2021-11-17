/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Clifford Wolf <clifford@clifford.at>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`ifdef PICOSOC_V
`error "upduino.v must be read before picosoc.v!"
`endif

`define PICOSOC_MEM ice40up5k_spram

module upduino (
	output ser_tx,
	input ser_rx,

	output led_red,
	output led_green,
    output led_blue,

	output flash_csb,
	output flash_clk,
	inout  flash_sdi,
	inout  flash_sdo,

	// HyperBus
	output hb_rstn,
	output hb_clk,	
	output hb_clkn,
	output hb_cs1n,
	inout hb_dq7,
	inout hb_dq6,
	inout hb_dq5,
	inout hb_dq4,
	inout hb_dq3,
	inout hb_dq2,
	inout hb_dq1,
	inout hb_dq0,
	inout hb_rwds
);
	parameter integer MEM_WORDS = 32768;

    wire clk;
    SB_HFOSC #(.CLKHF_DIV("0b11")) inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

	reg [5:0] reset_cnt = 0;
	wire resetn = &reset_cnt;

	always @(posedge clk) begin
		reset_cnt <= reset_cnt + !resetn;
	end

	wire flash_io0_oe, flash_io0_do, flash_io0_di;
	wire flash_io1_oe, flash_io1_do, flash_io1_di;
	wire flash_io2_oe, flash_io2_do, flash_io2_di;
	wire flash_io3_oe, flash_io3_do, flash_io3_di;

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) flash_io_buf [1:0] (
		.PACKAGE_PIN({flash_sdo, flash_sdi}),
		.OUTPUT_ENABLE({flash_io1_oe, flash_io0_oe}),
		.D_OUT_0({flash_io1_do, flash_io0_do}),
		.D_IN_0({flash_io1_di, flash_io0_di})
	);


	// GPIOs = LEDs
	reg [31:0] gpio;
/*
	wire [7:0] led_red_pwm, led_green_pwm, led_blue_pwm;

	SB_RGBA_DRV 
	#( 
		.CURRENT_MODE("0b1"),  
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	)
	rgb (
		.RGBLEDEN (1'b1),
		.RGB0PWM  (led_blue_pwm),
		.RGB1PWM  (led_green_pwm),
		.RGB2PWM  (led_red_pwm),
		.CURREN   (1'b1),
		.RGB0     (led_blue),
		.RGB1     (led_green),
		.RGB2     (led_red)
	);

	reg [31:0] gpio;
	assign led_red_pwm = gpio[23:16];
    assign led_green_pwm = gpio[15:8];
    assign led_blue_pwm = gpio[7:0];
*/
	assign led_red = gpio[2];
    assign led_green = gpio[2];
    assign led_blue = gpio[0];


	// picosoc iomem bus
	wire        iomem_valid;
	logic       iomem_ready;
	wire [3:0]  iomem_wstrb;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	logic [31:0] iomem_rdata;

	// GPIO bus signals

	reg gpio_ready;
	reg [31:0] gpio_rdata;

	always @(posedge clk) begin
		if (!resetn) begin
			gpio <= 0;
		end else begin
			gpio_ready <= 0;
			if (iomem_valid && !gpio_ready && iomem_addr[31:24] == 8'h 03) begin
				gpio_ready <= 1;
				gpio_rdata <= gpio;
				if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
				if (iomem_wstrb[1]) gpio[15: 8] <= iomem_wdata[15: 8];
				if (iomem_wstrb[2]) gpio[23:16] <= iomem_wdata[23:16];
				if (iomem_wstrb[3]) gpio[31:24] <= iomem_wdata[31:24];
			end
		end
	end




	// HyperRAM IP <-> IO pads (internal)
    wire [7:0] hb_dq_o;
	wire [7:0] hb_dq_i;
    wire hb_dq_oen;
    wire hb_rwds_o, hb_rwds_i, hb_rwds_oen;

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) hyperram_io_buf [8:0] (
		.PACKAGE_PIN({ hb_rwds, hb_dq7, hb_dq6, hb_dq5, hb_dq4, hb_dq3, hb_dq2, hb_dq1, hb_dq0 }),
		.OUTPUT_ENABLE({ !hb_rwds_oen, {8{!hb_dq_oen}} }),
		.D_OUT_0({ hb_rwds_o, hb_dq_o }),
		.D_IN_0({ hb_rwds_i, hb_dq_i })
	);

	// Wishbone signals
	wire wb_clk_o, wb_rst_o;
	wire wbm_stb_o, wbm_cyc_o, wbm_we_o;
	wire [3:0] wbm_sel_o;
	wire [31:0] wbm_addr_o;
	wire [31:0] wbm_dat_o;
	wire [31:0] wbm_dat_i;
	wire wbm_ack_i;

    wb_hyperram hyperram_drv (
        .wb_clk_i       (wb_clk_o),
        .wb_rst_i       (wb_rst_o),
        
        .wbs_stb_i      (wbm_stb_o),
        .wbs_cyc_i      (wbm_cyc_o),
        .wbs_we_i       (wbm_we_o),
        .wbs_sel_i      (wbm_sel_o),
        .wbs_dat_i      (wbm_dat_o),
        .wbs_addr_i     (wbm_addr_o),
        .wbs_ack_o      (wbm_ack_i),
        .wbs_dat_o      (wbm_dat_i),	

        .rst_i			(!resetn),

        .hb_rstn_o      (hb_rstn),	    // #RST
        .hb_csn_o       (hb_cs1n),	    // #CS
        .hb_clk_o       (hb_clk),
        .hb_clkn_o      (hb_clkn),      // #CLK
        .hb_rwds_o      (hb_rwds_o),
        .hb_rwds_oen    (hb_rwds_oen),	// #RWDS_OE
        .hb_dq_o        (hb_dq_o),
        .hb_dq_oen      (hb_dq_oen),    // #DQ_OE
        .hb_rwds_i      (hb_rwds_i),
        .hb_dq_i        (hb_dq_i)
    );
    
	assign wb_clk_o = clk;
	assign wb_rst_o = !resetn;

    assign wbm_cyc_o = iomem_valid;
	assign wbm_stb_o = iomem_valid && (iomem_addr[31:24] == 8'h 30);
	assign wbm_sel_o = iomem_wstrb;
	assign wbm_we_o = |iomem_wstrb;
	assign wbm_addr_o = iomem_addr;
	assign wbm_dat_o = iomem_wdata;

	always @(*) begin
		if (wbm_stb_o) begin
			iomem_rdata <= wbm_dat_i;
			iomem_ready <= wbm_ack_i;			
		end
		else if (iomem_valid && (iomem_addr[31:24] == 8'h 03)) begin
			iomem_rdata <= gpio_rdata;
			iomem_ready <= gpio_ready;
		end
		else begin
			iomem_rdata <= 32'h 0000_0000;
			iomem_ready <= 0;
		end
	end



	picosoc #(
		.BARREL_SHIFTER(0),
		.ENABLE_MULDIV(0),
		.MEM_WORDS(MEM_WORDS)
	) soc (
		.clk          (clk         ),
		.resetn       (resetn      ),

		.ser_tx       (ser_tx      ),
		.ser_rx       (ser_rx      ),

		.flash_csb    (flash_csb   ),
		.flash_clk    (flash_clk   ),

		.flash_io0_oe (flash_io0_oe),
		.flash_io1_oe (flash_io1_oe),
		.flash_io2_oe (flash_io2_oe),
		.flash_io3_oe (flash_io3_oe),

		.flash_io0_do (flash_io0_do),
		.flash_io1_do (flash_io1_do),
		.flash_io2_do (flash_io2_do),
		.flash_io3_do (flash_io3_do),

		.flash_io0_di (flash_io0_di),
		.flash_io1_di (flash_io1_di),
		.flash_io2_di (flash_io2_di),
		.flash_io3_di (flash_io3_di),

		.irq_5        (1'b0        ),
		.irq_6        (1'b0        ),
		.irq_7        (1'b0        ),

		.iomem_valid  (iomem_valid ),
		.iomem_ready  (iomem_ready ),
		.iomem_wstrb  (iomem_wstrb ),
		.iomem_addr   (iomem_addr  ),
		.iomem_wdata  (iomem_wdata ),
		.iomem_rdata  (iomem_rdata )
	);
endmodule
