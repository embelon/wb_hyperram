`default_nettype none
module wb_hyperram
#(
	parameter BASE_ADDR = 32'h3000_0000,
	parameter MEM_SIZE = 32'h0400_0000		// 64MB
)
(
	input			wb_clk_i,
	input			wb_rst_i,
	
	input			wbs_stb_i,
	input			wbs_cyc_i,
	input			wbs_we_i,
	input	[3:0] 	wbs_sel_i,
	input 	[31:0] 	wbs_dat_i,
	input	[31:0] 	wbs_addr_i,
	output			wbs_ack_o,
	output	[31:0] 	wbs_dat_o,	

	input			rst_i,

	output			hb_rst_o,
	output			hb_csn_o,
	output			hb_clk_o,
	output			hb_clkn_o,
	output			hb_rwds_o,
	output			hb_rwds_oen,
	output	[7:0]	hb_dq_o,
	output			hb_dq_oen,
	input			hb_rwds_i,
	input	[7:0]	hb_dq_i	
);

	// 30xxxxxx, 31xxxxxx, 32xxxxxx, 33xxxxxx -> RAM
	// 340100xx -> RAM REG
	// 340200xx -> CSR
	parameter HB_RAM_BASE_MASK = 32'hfc00_0000;
	parameter HB_RAM_BASE = BASE_ADDR;
	parameter HB_REG_BASE_MASK = 32'hffff_ff00;
	parameter HB_REG_BASE = BASE_ADDR + 32'h0401_0000;
	parameter CSR_BASE_MASK = 32'hffff_ff00;
	parameter CSR_BASE = BASE_ADDR + 32'h0402_0000;
	
	// Combinatorial decoding
	wire hb_ram_valid;
	wire hb_reg_valid;
	wire csr_valid;	
	
	assign hb_ram_valid = wbs_stb_i && wbs_cyc_i && ((wbs_addr_i & HB_RAM_BASE_MASK) == HB_RAM_BASE);
	assign hb_reg_valid = wbs_stb_i && wbs_cyc_i && ((wbs_addr_i & HB_REG_BASE_MASK) == HB_REG_BASE);
	assign csr_valid = wbs_stb_i && wbs_cyc_i && ((wbs_addr_i & CSR_BASE_MASK) == CSR_BASE);
	
	// last cycle value of csr_valid
	// needed to satisfy Wishbone handshake on wbs_ack_o -> wbs_stb_i
	// and avoid second, spurious operation on CSR
	reg csr_valid_prev_r;

	wire [31:0] sub_address;
	always @(*) begin
		if (hb_reg_valid)
			sub_address <= wbs_addr_i & ~HB_REG_BASE_MASK;
		else if (hb_ram_valid)
			sub_address <= wbs_addr_i & ~HB_RAM_BASE_MASK;
		else if (csr_valid)
			sub_address <= wbs_addr_i & ~CSR_BASE_MASK;
		else
			sub_address <= 0;
	end

	parameter CSR_LATENCY_BASE 		= CSR_BASE;
	parameter CSR_TPRE_TPOST_BASE 	= CSR_BASE + 4;
	parameter CSR_TCSH_BASE 		= CSR_BASE + 8;
	parameter CSR_TRMAX_BASE 		= CSR_BASE + 12;
	parameter CSR_STATUS_BASE 		= CSR_BASE + 16;
	
	wire csr_latency_valid, csr_tpre_tpost_valid, csr_tcsh_valid, csr_trmax_valid, csr_status_valid;
	
	assign csr_latency_valid = csr_valid && (wbs_addr_i == CSR_LATENCY_BASE);
	assign csr_tpre_tpost_valid = csr_valid && (wbs_addr_i == CSR_TPRE_TPOST_BASE);
	assign csr_tcsh_valid = csr_valid && (wbs_addr_i == CSR_TCSH_BASE);
	assign csr_trmax_valid = csr_valid && (wbs_addr_i == CSR_TRMAX_BASE);
	assign csr_status_valid = csr_valid && (wbs_addr_i == CSR_STATUS_BASE);

	// CSRs values
	wire fixed_latency;
	wire double_latency;
	wire [3:0] tacc;
	wire [3:0] tpre;
	wire [3:0] tpost;
	wire [3:0] tcsh;
	wire [4:0] trmax;
	register_rw
	#(
		.WIDTH(6),
		.DEFAULT_VALUE(6'h34)
	)
	latency_shadow_reg
	(
		.rst(wb_rst_i),
		.clk(wb_clk_i),
		.wren( !csr_valid_prev_r && csr_latency_valid & wbs_we_i & wbs_sel_i[0] ),
		.data_in( wbs_dat_i[5:0] ),
		.data_out( {fixed_latency, double_latency, tacc} )
	);

	register_rw 
	#(
		.WIDTH(8),	
		.DEFAULT_VALUE(8'h66)
	)
	tpre_tpost_shadow_reg
	(
		.rst(wb_rst_i),
		.clk(wb_clk_i),
		.wren( !csr_valid_prev_r && csr_tpre_tpost_valid & wbs_we_i & wbs_sel_i[0] ),
		.data_in( wbs_dat_i[7:0] ),
		.data_out( {tpre, tpost} )
	);

	register_rw 
	#(
		.WIDTH(4),	
		.DEFAULT_VALUE(4'h4)
	)
	tcsh_shadow_reg
	(
		.rst(wb_rst_i),
		.clk(wb_clk_i),
		.wren( !csr_valid_prev_r && csr_tcsh_valid & wbs_we_i & wbs_sel_i[0] ),
		.data_in( wbs_dat_i[3:0] ),
		.data_out( tcsh )
	);

	register_rw 
	#(
		.WIDTH(5),	
		.DEFAULT_VALUE(5'h14)
	)
	trmax_shadow_reg
	(
		.rst(wb_rst_i),
		.clk(wb_clk_i),
		.wren( !csr_valid_prev_r && csr_trmax_valid & wbs_we_i & wbs_sel_i[0] ),
		.data_in( wbs_dat_i[4:0] ),
		.data_out( trmax )
	);

	wire hb_read_timeout;
	wire hb_ready;
	wire [31:0] hb_data_out;

	hyperram hram
	(
		.clk_i( wb_clk_i ),
		.rst_i( rst_i || wb_rst_i ),
		.valid_i( hb_ram_valid | hb_reg_valid ),
		.wren_i(wbs_we_i),
		.regspace_i( hb_reg_valid ),
		.addr_i( sub_address ),
		.sel_i(wbs_sel_i),
		.data_i(wbs_dat_i),
		.ready_o(hb_ready),
		.data_o(hb_data_out),

		.read_timeout_o(hb_read_timeout),

		.tcsh_i(tcsh),
		.tpre_i(tpre),		
		.tpost_i(tpost),
		.trmax_i(trmax),
		.tacc_i(tacc),
		.fixed_latency_i(fixed_latency),
		.double_latency_i(double_latency),		

		.hb_rst_o(hb_rst_o),
		.hb_csn_o(hb_csn_o),
		.hb_clk_o(hb_clk_o),
		.hb_clkn_o(hb_clkn_o),
		.hb_rwds_o(hb_rwds_o),
		.hb_rwds_oen(hb_rwds_oen),
		.hb_dq_o(hb_dq_o),
		.hb_dq_oen(hb_dq_oen),
		.hb_rwds_i(hb_rwds_i),
		.hb_dq_i(hb_dq_i)	
	);
	
	always @(*) begin
		if (wbs_we_i) begin
			wbs_dat_o <= 32'h0000_0000;
		end else begin
			case (wbs_addr_i)
				CSR_LATENCY_BASE: 		wbs_dat_o <= {26'h00_0000, fixed_latency, double_latency, tacc};
				CSR_TPRE_TPOST_BASE:	wbs_dat_o <= {24'h00_0000, tpre, tpost};
				CSR_TCSH_BASE:			wbs_dat_o <= {28'h00_0000, tcsh};
				CSR_TRMAX_BASE:			wbs_dat_o <= {29'h00_0000, trmax};
				CSR_STATUS_BASE:		wbs_dat_o <= {31'h0000_0000, hb_read_timeout};
				default: begin
					if (((wbs_addr_i & HB_RAM_BASE_MASK) == HB_RAM_BASE) || ((wbs_addr_i & HB_REG_BASE_MASK) == HB_REG_BASE))
						wbs_dat_o <= hb_data_out;
					else
						wbs_dat_o <= 32'h0000_0000;
				end
			endcase
		end
	end

	// delaying wbs_ack_o one cycle for CSR accesses
	reg csr_ack_r;
	always @(posedge wb_clk_i) begin
		csr_valid_prev_r <= csr_valid;

		if (rst_i || wb_rst_i) begin
			csr_ack_r <= 0;
		end else if (csr_latency_valid || csr_tpre_tpost_valid || csr_tcsh_valid || csr_trmax_valid || csr_status_valid) begin			
			csr_ack_r <= 1;
		end else begin
			csr_ack_r <= 0;
		end
	end
	
	assign wbs_ack_o = (hb_ram_valid || hb_reg_valid) ? hb_ready : (csr_ack_r & csr_valid);



`ifdef FORMAL

// global clock needed because design works on both edges of incoming clock
(* gclk *) reg formal_timestep;

// register for knowing if we have just started
reg f_past_valid = 0;

parameter WB_RST = 0, WB_IDLE = 1, WB_WAITING = 2, WB_FINISH = 3;
reg [1:0] wb_state;

initial wb_state <= WB_RST;

// start in reset
initial assume(rst_i);
initial assume(!wb_clk_i);
initial assume(wb_rst_i);
initial assume(!wbs_stb_i);
initial assume(!wbs_cyc_i);

//always @(posedge wb_clk_i) begin
always @($global_clock) begin       

    // update past_valid reg so we know it's safe to use $past()
    f_past_valid <= 1;    

	// Emulating proper behavior of WB
	// 1. rst_i and wb_rst_i can change only on rising edges of wb_clk_i
    if (f_past_valid) begin
    	if ($fell(rst_i) || $rose(rst_i))
    	    assume($fell(wb_clk_i));	
		if ($fell(wb_rst_i) || $rose(wb_rst_i))
			assume($fell(wb_clk_i));		
    end
	// 2. wb_clk_i needs to change every simulation clock cycle
    if (f_past_valid) begin
        assume(wb_clk_i != $past(wb_clk_i));
    end   
	// 3. after deactivating rst_i or wb_rst_i, no possible activation of those
	if (f_past_valid) begin
		if (!$past(rst_i))
			assume(!rst_i);
		if (!$past(wb_rst_i))
			assume(!wb_rst_i);
	end
	// 4. wbs_stb_i and wbs_cyc_i can change only on rising edge of wb_clk_i
	if (f_past_valid) begin
		if ($fell(wbs_stb_i) || $rose(wbs_stb_i))
			assume($rose(wb_clk_i));
		if ($fell(wbs_cyc_i) || $rose(wbs_cyc_i))
			assume($rose(wb_clk_i));		
	end

	// Wishbone bus state machine
	if ($past(wb_clk_i) && !wb_clk_i) begin
		if (rst_i || wb_rst_i) begin
			wb_state <= WB_RST;
		end else begin
			case (wb_state)
				WB_RST: begin
					wb_state <= WB_IDLE;
				end
				WB_IDLE: begin
					if (wbs_cyc_i && wbs_stb_i) begin
						wb_state <= WB_WAITING;
					end
				end
				WB_WAITING: begin
					if (wbs_ack_o) begin
						wb_state <= WB_FINISH;
					end
				end
				WB_FINISH: begin
					if (!wbs_stb_i) begin
						wb_state <= WB_IDLE;
					end
				end
			endcase
		end
	end

	if (wb_state == WB_RST) begin
		assume(!wbs_stb_i);
		assume(!wbs_cyc_i);
	end

	if (wb_state == WB_WAITING) begin
		assume(wbs_cyc_i);
		assume(wbs_stb_i);
		assume($stable(wbs_addr_i));
		assume($stable(wbs_dat_i));
		assume($stable(wbs_sel_i));
		assume($stable(wbs_we_i));
	end
	
	if (wb_state == WB_FINISH) begin
		assume(!wbs_stb_i);
		assume($stable(wbs_addr_i));
		assume($stable(wbs_dat_i));
		assume($stable(wbs_sel_i));
		assume($stable(wbs_we_i));
	end

	// COVER

	// LOAD timings to registers

    if (f_past_valid) begin
        _load_tacc_: 			cover(!rst_i && ($past(tacc) > 7) && (tacc < 7));   
		_load_fixed_:			cover(!rst_i && !$past(fixed_latency) && fixed_latency);   
		_load_fixed_double_:	cover(!rst_i && !$past(fixed_latency) && fixed_latency && !$past(double_latency) && double_latency);   
		_load_latency_:			cover(!rst_i && (tacc > 9) && fixed_latency && !double_latency);   
	end

    if (f_past_valid)
        _load_tcsh_: cover(!rst_i && (tcsh > 7));   

    if (f_past_valid)
        _load_tpre_: cover(!rst_i && (tpre > 9));   
     
    if (f_past_valid)
        _load_post_: cover(!rst_i && (tpost > 11));        
     
    if (f_past_valid)
        _load_trmax_: cover(!rst_i && (trmax == 9));    

	// READ CSRs

    if (f_past_valid)
        _read_latency_: cover(	
								!$past(rst_i) 
							&& !rst_i 
							&& (wb_state == WB_FINISH)
							&& $past(csr_latency_valid)
							&& $past(wbs_ack_o)
							&& !wbs_ack_o
							&& $past(fixed_latency)
							&& !$past(double_latency)
							&& ($past(tacc) == 5)								
							&& !$past(wbs_we_i)				
							&& ($past(wbs_dat_o) == $past( {fixed_latency, double_latency, tacc} ))			
							&& ($past(wbs_sel_i) == 4'b0001) 
						);   

    if (f_past_valid)
        _read_tcsh_: cover(	
								!$past(rst_i) 
							&& !rst_i 
							&& (wb_state == WB_FINISH)
							&& $past(csr_tcsh_valid)
							&& $past(wbs_ack_o)
							&& !wbs_ack_o
							&& ($past(tcsh) == 7)								
							&& !$past(wbs_we_i)				
							&& ($past(wbs_dat_o) == $past(tcsh))			
							&& ($past(wbs_sel_i) == 4'b0001) 
						);  

    if (f_past_valid)
        _read_tpre_tpost_: cover(	
								!$past(rst_i) 
							&& !rst_i 
							&& (wb_state == WB_FINISH)
							&& $past(csr_tpre_tpost_valid)
							&& $past(wbs_ack_o)
							&& !wbs_ack_o
							&& ($past(tpre) == 7)						
							&& ($past(tpost) == 6)		
							&& !$past(wbs_we_i)				
							&& ($past(wbs_dat_o) == {24'h00_0000, $past(tpre), $past(tpost)} )			
							&& ($past(wbs_sel_i) == 4'b0001) 
						);  

    if (f_past_valid)
        _read_trmax_: cover(	
								!$past(rst_i) 
							&& !rst_i 
							&& (wb_state == WB_FINISH)
							&& $past(csr_trmax_valid)
							&& $past(wbs_ack_o)
							&& !wbs_ack_o
							&& ($past(trmax) == 13)						
							&& !$past(wbs_we_i)				
							&& ($past(wbs_dat_o) == $past(trmax))			
							&& ($past(wbs_sel_i) == 4'b0001) 
						);  

    if (f_past_valid)
        _read_status_: cover(	
								!$past(rst_i) 
							&& !rst_i 
							&& (wb_state == WB_FINISH)
							&& $past(wbs_ack_o)
							&& !wbs_ack_o				
							&& ($past(hb_read_timeout) == 1)
							&& !$past(wbs_we_i)				
							&& ($past(wbs_dat_o) == hb_read_timeout)			
							&& ($past(wbs_sel_i) == 4'b0001) 
						);  						

	// WRITE REGISTER

    // try writing register space - no latency   
    if (f_past_valid)
        _tx_hreg_: cover(		!$past(rst_i) 
							&& !rst_i 
							&& $past(hb_reg_valid)
							&& !$past(hb_ready)
							&& hb_ready
							&& (tacc == 4)	
							&& $past(wbs_we_i)							
							&& ($past(wbs_dat_i) == 32'h78123456) 
							&& ($past(wbs_sel_i) == 4'b1010) 
							&& ($past(wbs_addr_i[2:0]) == 2)
						);   

	// READ REGISTER

    // try reading register space - variable & single latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hreg_: cover(		!$past(rst_i) 
							&& !rst_i 
							&& $past(hb_reg_valid)
							&& !$past(hb_ready) 
							&& hb_ready
							&& ($past(tacc) == 4) 								
							&& !$past(wbs_we_i)
							&& ($past(wbs_dat_o) == 32'h0000f97c) 
							&& !hb_read_timeout 
						);   

    // try reading register space - variable & single latency, tacc = 4, timeout
    if (f_past_valid)
        _rx_hreg_timeout: cover(		
								!$past(rst_i) 
							&& !rst_i 
							&& $past(hb_reg_valid)
							&& !$past(hb_ready) 
							&& hb_ready
							&& ($past(tacc) == 4) 	
							&& ($past(trmax) == 8)							
							&& !$past(wbs_we_i)
							&& hb_read_timeout 
						);   

	// WRITE MEMORY

    // try writing memory space - fixed, double latency
    if (f_past_valid)
        _tx_hmem_: cover(		!$past(rst_i) 
							&& !rst_i 
							&& $past(hb_ram_valid)
							&& !$past(hb_ready) 
							&& hb_ready
							&& $past(fixed_latency) 
							&& $past(double_latency) 
							&& ($past(tacc) == 4)
							&& ($past(tpre) == 1)
							&& ($past(tpost) == 2)
							&& $past(wbs_we_i)														
							&& ($past(wbs_dat_i) == 32'h78123456)
							&& ($past(wbs_sel_i) == 4'b0110) 
							&& ($past(wbs_addr_i[2:0]) == 3)							
						);  

	// READ MEMORY

    // try reading memory space - variable & single latency, shortest possible tacc = 2, no timeout
    if (f_past_valid)
        _rx_hmem_: cover(		!$past(rst_i) 
							&& !rst_i 
							&& $past(hb_ram_valid)
							&& !$past(hb_ready) 
							&& $past(fixed_latency) 
							&& $past(double_latency) 
							&& hb_ready
							&& ($past(tacc) == 4) 								
							&& !$past(wbs_we_i)
							&& ($past(wbs_dat_o) == 32'h1364f97c) 
							&& !hb_read_timeout 
						); 


	if (!wbs_cyc_i || !wbs_stb_i) begin
		assert(!wbs_ack_o);
	end

	// reading CSRs
	if (f_past_valid && !rst_i && !wb_rst_i) begin
		if (hb_read_timeout && wbs_cyc_i && wbs_stb_i && !wbs_we_i && (wbs_addr_i == CSR_STATUS_BASE))
			_read_status_timeout_: 		assert(wbs_dat_o == 1);
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && (wbs_addr_i == CSR_LATENCY_BASE))
			_read_latency_reg:			assert(wbs_dat_o == {26'h000_0000, fixed_latency, double_latency, tacc});
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && (wbs_addr_i == CSR_TPRE_TPOST_BASE))
			_read_tpre_tpost_reg:		assert(wbs_dat_o == {24'h00_0000, tpre, tpost});
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && (wbs_addr_i == CSR_TRMAX_BASE))
			_read_trmax_reg:			assert(wbs_dat_o == {29'h000_0000, trmax});
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && (wbs_addr_i == CSR_TCSH_BASE))
			_read_tcsh_reg:				assert(wbs_dat_o == {28'h000_0000, tcsh});
	end

	// writing CSRs
	if (f_past_valid && !rst_i && !wb_rst_i) begin
		if ($rose(wb_clk_i) && $past(wbs_cyc_i) && $past(wbs_stb_i) && $past(wbs_we_i) && ($past(wbs_sel_i[0]) == 1)) begin
			if ($past(wbs_addr_i) == CSR_LATENCY_BASE)
				_write_latency_reg:			assert(wbs_dat_i[5:0] == {fixed_latency, double_latency, tacc});
			if ($past(wbs_addr_i) == CSR_TPRE_TPOST_BASE)
				_write_tpre_tpost_reg:		assert(wbs_dat_i[7:0] == {tpre, tpost});
			if ($past(wbs_addr_i) == CSR_TRMAX_BASE)
				_write_trmax_reg:			assert(wbs_dat_i[4:0] == trmax);
			if (wbs_addr_i == CSR_TCSH_BASE)
				_write_tcsh_reg:			assert(wbs_dat_i[3:0] == tcsh);
		end
	end

	// reading hyperram
	if (f_past_valid && !rst_i && !wb_rst_i) begin
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && ((wbs_addr_i & HB_RAM_BASE_MASK) == HB_RAM_BASE))
			_read_hb_ram_:				assert(wbs_dat_o == hb_data_out);
		if (wbs_cyc_i && wbs_stb_i && !wbs_we_i && ((wbs_addr_i & HB_REG_BASE_MASK) == HB_REG_BASE))
			_read_hb_reg_:				assert(wbs_dat_o == hb_data_out);
	end

	// hyperram operation
	if (f_past_valid && !rst_i && !wb_rst_i) begin
		if (wbs_cyc_i && wbs_stb_i && wbs_we_i && ((wbs_addr_i & HB_RAM_BASE_MASK) == HB_RAM_BASE) && !hb_csn_o)
			_rd_wr_hb_ram_:				assert(!wbs_ack_o);
		if (wbs_cyc_i && wbs_stb_i && wbs_we_i && ((wbs_addr_i & HB_REG_BASE_MASK) == HB_REG_BASE) && !hb_csn_o)
			_rd_wr_hb_reg_:				assert(!wbs_ack_o);			
	end

end
`endif

endmodule


