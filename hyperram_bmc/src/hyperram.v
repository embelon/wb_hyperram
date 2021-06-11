`default_nettype none
module hyperram
#(
	parameter DEFAULT_TCSH = 4,
	parameter DEFAULT_TPRE = 4,
	parameter DEFAULT_TACC = 6,
	parameter DEFAULT_TPOST = 4,
	parameter DEFAULT_TIMEOUT = 20,
	parameter FIXED_LATENCY = 1,
	parameter DOUBLE_LATENCY = 1
)
(
	input			clk_i,
	input			rst_i,
	input			valid_i,
	input			wren_i,
	input			regspace_i,
	input	[31:0]  addr_i,
	input	[3:0]	sel_i,
	input	[31:0]	data_i,
	output			ready_o,
	output	[31:0]	data_o,
	output			read_timeout_o,

	input	[3:0]	tcsh_i,						// CS high time, between operations
	input	[3:0]	tpre_i,						// CS fall to first edge of clock
	input	[3:0]	tpost_i,					// last edge of clock to CS rise
	input	[4:0]	trmax_i,					// max timeout for read
	input	[3:0]	tacc_i,						// latency
	input			fixed_latency_i,			// fixed latency vs variable latency
	input			double_latency_i,			// 2x latency (valid only if fixed latency set)
	
	output			hb_rstn_o,					// #RST
	output			hb_csn_o,					// #CS
	output			hb_clk_o,
	output			hb_clkn_o,					// #CLK
	output			hb_rwds_o,
	output			hb_rwds_oen,				// #RWDS_OE
	output	[7:0]	hb_dq_o,
	output			hb_dq_oen,					// #DQ_OE
	input			hb_rwds_i,
	input	[7:0]	hb_dq_i
);

parameter MIN_TACC = 2;
parameter MIN_TIMEOUT = 4;

// local copy of configuration signals
reg [3:0] tcsh_r;
reg [3:0] tpre_r;
reg [3:0] tacc_r;
reg [3:0] tpost_r;
reg [4:0] trmax_r;
reg fixed_latency_r;
reg double_latency_r;

// local copy of operation signals
reg [31:0] dataw_r;
reg [47:0] CA_r;
reg [3:0] sel_r;
reg busy_r;
reg read_timeout_r;

// FSM
parameter S_IDLE = 0, S_PRE = 1, S_CA = 2, S_LATENCY = 3, S_WRITE = 4, S_READ = 5, S_POST = 6;
reg [2:0] bus_state_r;

// local aliases for CA_r
wire read_op;
assign read_op = CA_r[47];
wire reg_access;
assign reg_access = CA_r[46];

// rwds sampled during READ phase to clock in valid data
reg rwds_r;
// rwds sampled during CA phase to determine latency multiplier (1x, 2x)
reg rwds_2x_latency_r;

// actual latency in cycles
logic [5:0] latency_cycles;
// start calculating latency 2+ cycles ahead of need
//always @(read_op, tacc_r, fixed_latency_r, double_latency_r, rwds_2x_latency_r) begin
always @(*) begin
	if (fixed_latency_r) begin
		// force fixed latency
		// ignore rwds input during CA phase
		if (read_op) begin
			// read operation needs additional cycle, because of delayed data output
			latency_cycles <= double_latency_r ? ( {tacc_r, 2'b00} - 2 ) : ( {1'b0, tacc_r, 1'b0} - 2 );
		end else begin
			latency_cycles <= double_latency_r ? ( {tacc_r, 2'b00} - 2 - 1 ) : ( {1'b0, tacc_r, 1'b0} - 2 - 1 );
		end
	end else begin
		// set latency according to rwds input during CA phase
		if (read_op) begin
			// read operation needs additional cycle, because of delayed data output
			latency_cycles <= rwds_2x_latency_r ? ( {tacc_r, 2'b00} - 2 ) : ( {1'b0, tacc_r, 1'b0} - 2 );
		end else begin
			latency_cycles <= rwds_2x_latency_r ? ( {tacc_r, 2'b00} - 2 - 1 ) : ( {1'b0, tacc_r, 1'b0} - 2 - 1 );
		end
	end			
end

// registering previous value of valid_i to wait for handshake ready_o -> valid_i signal, before starting new operation
// (upper level needs to deactivate valid_i for at least one cycle)
reg valid_r;
// start of operation
wire valid_start;
assign valid_start = ~valid_r & valid_i;

// timing counter (phase cycles or timeout for READ)
reg [5:0] cycle_cnt_r;
// bytes counter for READ phase
reg [2:0] read_cnt_r;
// general FSM handling upper level interface, phases, timeouts and write operations
always @(posedge clk_i) begin
	if (rst_i) begin
		bus_state_r <= S_IDLE;
		cycle_cnt_r <= DEFAULT_TCSH;		
		
		valid_r <= 0;
		dataw_r <= 32'h0000;
		CA_r <= 48'h00_0000;
		sel_r <= 4'h0;
		busy_r <= 0;
		read_timeout_r <= 0;
		
		tcsh_r <= DEFAULT_TCSH;
		tpre_r <= DEFAULT_TPRE;
		tacc_r <= (DEFAULT_TACC >= MIN_TACC) ? DEFAULT_TACC : MIN_TACC;
		tpost_r <= DEFAULT_TPOST;
		trmax_r <= (DEFAULT_TIMEOUT >= MIN_TIMEOUT) ? DEFAULT_TIMEOUT : MIN_TIMEOUT;
		fixed_latency_r <= FIXED_LATENCY;
		double_latency_r <= DOUBLE_LATENCY;
	end else begin

		valid_r <= valid_i;

		case (bus_state_r)
			S_IDLE: begin			
				// waiting for new operation and counting cycles to satisfy tcshi time
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end 
				if (valid_start && !busy_r) begin
					// upper level interface is requesting some operation
					// need to store local copy of operation definition
					
					busy_r <= 1;				// ip is busy from upper level POV from now, 
												// but may spent few additional cycles in IDLE (to satisfy min tcsh)
				
					dataw_r <= data_i;			// data to be written (memory space or register space of HyperRAM device)
					sel_r <= sel_i;
					
					CA_r[47] <= ~wren_i;			// write (0) / read (1)
					CA_r[46] <= regspace_i;			// memory(0) / register space (1)
					CA_r[45] <= 1;					// linear
					CA_r[44:16] <= addr_i[31:3];
					CA_r[15:3] <= 13'h0000;
					CA_r[2:0] <= addr_i[2:0];
	
					read_timeout_r <= 0;
				end
				if (~|cycle_cnt_r && (busy_r || (!busy_r && valid_start))) begin
					// tcsh satisfied now, so may start new or queued operation

					bus_state_r <= S_PRE;
					cycle_cnt_r <= tpre_i;
					
					tcsh_r <= tcsh_i;
					tpre_r <= tpre_i;
					tacc_r <= (tacc_i >= MIN_TACC) ? tacc_i : MIN_TACC;
					tpost_r <= tpost_i;						
					trmax_r <= (trmax_i >= MIN_TIMEOUT) ? trmax_i : MIN_TIMEOUT;
					fixed_latency_r <= fixed_latency_i;
					double_latency_r <= double_latency_i;
				end
			end
			S_PRE: begin
				// short delay for tcss
				// waiting configured number of cycles between CS going active and first edge of hb_clk
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end else begin
					bus_state_r <= S_CA;
					cycle_cnt_r <= 5;				// during CA phase 6 bytes will be transfered
				end
			end
			S_CA: begin
				// CA = Command-Address phase
				// transfering 6 bytes defining operation type and address
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end else begin
					cycle_cnt_r <= latency_cycles;
			    
					if (read_op) begin
						// read operation - there's always some latency (tacc x rwds or fixed)
						bus_state_r <= S_LATENCY;							
					end else begin
						// write operation
						if (reg_access) begin
							// register space - no latency, write is next to CA phase
							bus_state_r <= S_WRITE;
							cycle_cnt_r <= 1;		// only 2 bytes will be written to register space (each register is 16 bits wide)							
						end else begin
							// memory space - latency (tacc x rwds or fixed)
							bus_state_r <= S_LATENCY;
						end
					end
				end
			end
			S_LATENCY: begin
				// latency phase for reads and memory space writes
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end else begin
					if (read_op) begin
						// read operation
						bus_state_r <= S_READ;
						cycle_cnt_r <= {trmax_r, 1'b0} - 2;		// setup timeout for read operation
//						cycle_cnt_r <= {trmax_r - 1, 1'b0};		// setup timeout for read operation						
					end else begin
						// write operation / memory
						bus_state_r <= S_WRITE;
						cycle_cnt_r <= 3;						// 4 bytes will be written to memory
					end
				end
			end
			S_WRITE: begin
				// write to memory of register space
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end else begin
					bus_state_r <= S_POST;
					cycle_cnt_r <= tpost_r;
				end
			end
			S_READ: begin	
				if ((cycle_cnt_r == 0) || (read_cnt_r == 0)) begin
					bus_state_r <= S_POST;
					cycle_cnt_r <= tpost_r;

					// timeout occured if device wasnt driving rwds signal during READ phase
					read_timeout_r <= (cycle_cnt_r == 0) && (read_cnt_r != 0);
				end else if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end				
			end
			S_POST: begin
				// short delay for tcsh
				// waiting configured number of cycles between last edge of hb_clk and cs inactive
				if (cycle_cnt_r) begin
					cycle_cnt_r <= cycle_cnt_r - 1;
				end else begin
					bus_state_r <= S_IDLE;
					cycle_cnt_r <= tcsh_r;
					busy_r <= 0;
				end					
			end
		endcase
	end
end

// hyperbus interface clock
reg bus_clk_r;	

wire clk_active;
// skip generating one bus cycle at the end of read, as not needed
assign clk_active = (bus_state_r != S_IDLE) && (bus_state_r != S_PRE) && (bus_state_r != S_POST) && !((bus_state_r == S_READ) && (read_cnt_r < 2));

// data read from hyperbus (memory or register)
reg [31:0] datar_r;

// secondary clock "domain"
// generating ddr clock for hyperbus and handling read operations
always @(negedge clk_i) begin
	if (rst_i) begin
		bus_clk_r <= 0;
		read_cnt_r <= 0;
		
		datar_r <= 32'h0000_0000;
		rwds_r <= 0;
		rwds_2x_latency_r <= 1;
	end else begin
		// hyperbus clock change on falling edge of main clock and only in CA, LATENCY, WRITE, READ phases
		bus_clk_r <= clk_active ? ~bus_clk_r : 0;
	
		case (bus_state_r)
			S_IDLE: begin				
				rwds_2x_latency_r <= 1;					// initially, latency set to double (= default value for HyperRAM chip)
			end
			S_PRE: begin
				datar_r <= 32'h0000_0000;
			end
			S_CA: begin
				if (cycle_cnt_r == 2) begin
				    rwds_2x_latency_r <= hb_rwds_i;		// probing rwds during CA phase to get correct latency (single or double)
				    
					// configuring read counter for incoming READ phase
				    if (reg_access)
						read_cnt_r <= 2;				// registers are 16 bit wide
				    else
						read_cnt_r <= 4;				// memory is read as 32 bit
				end
			end
			S_READ: begin
				rwds_r <= hb_rwds_i;					// store rwds input for "B"-bytes, where rwds input is low
				if ((hb_rwds_i && !read_cnt_r[0]) || (rwds_r && read_cnt_r[0])) begin
					// count only valid bytes, according to rwds state in this clock cycle and previous clock cycle
					if (read_cnt_r) begin						
						read_cnt_r <= read_cnt_r - 1;						
					end
					// read data
					case (read_cnt_r)
						4: datar_r[31:24] <= hb_dq_i;
						3: datar_r[23:16] <= hb_dq_i;
						2: datar_r[15:8] <= hb_dq_i;
						1: datar_r[7:0] <= hb_dq_i;
					endcase
				end
			end
		endcase
	end
end

assign hb_rstn_o = ~rst_i;
assign hb_csn_o = (bus_state_r == S_IDLE) || rst_i;
assign hb_clk_o = bus_clk_r;
assign hb_clkn_o = ~hb_clk_o;

// when writing to register space, rwds must not be driven by ip
assign hb_rwds_oen = (bus_state_r != S_WRITE) || reg_access;
// when writing to memory space, rwds is masking signal for individual bytes
assign hb_rwds_o = ((bus_state_r == S_WRITE) && (!reg_access)) ? ~sel_r[cycle_cnt_r] : 0;

// DQ is driven only during CA and WRITE
assign hb_dq_oen = (bus_state_r != S_CA) && (bus_state_r != S_WRITE);

logic [7:0] hb_data_out;
//always @(bus_state_r, cycle_cnt_r, dataw_r) begin
always @(*) begin
    case (bus_state_r)
    	S_CA:		begin
			case (cycle_cnt_r)
				5:			hb_data_out <= CA_r[47:40];
				4:			hb_data_out <= CA_r[39:32];
				3:			hb_data_out <= CA_r[31:24];
				2:			hb_data_out <= CA_r[23:16];
				1:			hb_data_out <= CA_r[15:8];
				0:			hb_data_out <= CA_r[7:0];
				default:	hb_data_out <= 8'h00;
			endcase
//					hb_data_out <= CA_r[8*cycle_cnt_r+7:8*cycle_cnt_r];
		end
    	S_WRITE:	begin
			case (cycle_cnt_r)
				3:			hb_data_out <= dataw_r[31:24];
				2:			hb_data_out <= dataw_r[23:16];
				1:			hb_data_out <= dataw_r[15:8];
				0:			hb_data_out <= dataw_r[7:0];
				default:	hb_data_out <= 8'h00;
			endcase
//					hb_data_out <= dataw_r[8*cycle_cnt_r+7:8*cycle_cnt_r];
		end
    	default:	hb_data_out <= 8'h00;
    endcase
end

assign hb_dq_o = hb_data_out;
assign ready_o = ~busy_r;
assign data_o = datar_r;
assign read_timeout_o = read_timeout_r;
	
	
`ifdef FORMAL

// global clock needed because design works on both edges of incoming clock
(* gclk *) reg formal_timestep;

// register for knowing if we have just started
reg f_past_valid = 0;

// map data read to individual bytes
wire [7:0] datar_3, datar_2, datar_1, datar_0;
assign datar_3 = datar_r[31:24];
assign datar_2 = datar_r[23:16];
assign datar_1 = datar_r[15:8];
assign datar_0 = datar_r[7:0];

// start in reset
initial assume(rst_i);
initial assume(!clk_i);

//always @(posedge clk_i) begin
always @($global_clock) begin
        
    // update past_valid reg so we know it's safe to use $past()
    f_past_valid <= 1;    
    
    if (f_past_valid)
    	if ($fell(rst_i) || $rose(rst_i))
    	    assume($fell(clk_i));
       
    if (f_past_valid) begin
        assume(clk_i != $past(clk_i));
    end      

	// LOAD timings

    if (f_past_valid)
        _load_tacc_: cover(!rst_i && (tacc_r > 7));   

    if (f_past_valid)
        _load_tcsh_: cover(!rst_i && (tcsh_r > 7));   

    if (f_past_valid)
        _load_tpre_: cover(!rst_i && (tpre_r > 7));   
     
    if (f_past_valid)
        _load_post_: cover(!rst_i && (tpost_r > 7));        
     
    if (f_past_valid)
        _load_trmax_: cover(!rst_i && (trmax_r > 7));    

	// TCSH

    // try writing register space - no latency, tcsh = 7
    if (f_past_valid)
        _tx_hreg_tcsh_: cover(		!$past(rst_i) 
								&& !rst_i 
								&& (bus_state_r == S_PRE)
								&& !ready_o 
								&& !read_op 
								&& reg_access
								&& $past(tcsh_r == 7)
								&& (tcsh_r == 5)
							); 


	// WRITE REGISTER

    // try writing register space - no latency   
    if (f_past_valid)
        _tx_hreg_: cover(			!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4)								
								&& (dataw_r == 32'h78123456) 
								&& (sel_r == 4'b1010) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   								
								
    // try writing register space - no latency, tpre = 0, tpost = 0
    if (f_past_valid)
        _tx_hreg_tpre0_tpost0_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4)								
								&& (tpre_r == 0)
								&& (tpost_r == 0)
								&& (dataw_r == 32'h78123456) 
								&& (sel_r == 4'b1010) 
								&& CA_r[2:0] 
								&& CA_r[44:16]); 

    // try writing register space - no latency, tpre = 3, tpost = 5
    if (f_past_valid)
        _tx_hreg_tpre3_tpost5: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4)								
								&& (tpre_r == 3)
								&& (tpost_r == 5)
								&& (dataw_r == 32'h78123456) 
								&& (sel_r == 4'b1010) 
								&& CA_r[2:0] 
								&& CA_r[44:16]); 	

    // try writing register space - no latency, tpre = 15, tpost = 15
    if (f_past_valid)
        _tx_hreg_tpre15_tpost15: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4)								
								&& (tpre_r == 15)
								&& (tpost_r == 15)
								&& (dataw_r == 32'h78123456) 
								&& (sel_r == 4'b1010) 
								&& CA_r[2:0] 
								&& CA_r[44:16]); 

	// WRITE MEMORY

    // try writing memory space - variable & single latency, shortest possible tacc = 2
    if (f_past_valid)
        _tx_hmem_: cover(			!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& !$past(rwds_2x_latency_r)
								&& (sel_r == 4'b1010) 
								&& (dataw_r == 32'h78123456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try writing memory space - variable & single latency, tacc = 4, tpre = 2, tpost = 3
    if (f_past_valid)
        _tx_hmem_tacc4_tpre2_tpost3_: 
						cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r) 
								&& !$past(rwds_2x_latency_r)
								&& (sel_r == 4'b1010) 
								&& (tacc_r == 4)
								&& (tpre_r == 2)
								&& (tpost_r == 3)								 
								&& (dataw_r == 32'h78123456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try writing memory space - variable & double latency, tacc = 4, tpre = 15, tpost = 15
    if (f_past_valid)
        _tx_hmem_tacc4x2_tpre15_tpost15_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& !$past(double_latency_r) 
								&& $past(rwds_2x_latency_r) 
								&& (sel_r == 4'b1010) 
								&& (tacc_r == 4)
								&& (tpre_r == 15)
								&& (tpost_r == 15)								
								&& (dataw_r == 32'h78123456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);       


    // try writing memory space - fixed & single latency, tacc = 6, tpre = 1, tpost = 2
    if (f_past_valid)
        _tx_hmem_fixedlatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& !reg_access 
								&& $past(fixed_latency_r) 
								&& !$past(double_latency_r) 								
								&& $past(rwds_2x_latency_r) 
								&& (sel_r == 4'b1010) 
								&& (tacc_r == 6)
								&& (tpre_r == 1)
								&& (tpost_r == 2)								
								&& (dataw_r == 32'h78123456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);  

    // try writing memory space - fixed & double latency, tacc = 15, tpre = 2, tpost = 5
    if (f_past_valid)
        _tx_hmem_fixeddoublelatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& !read_op 
								&& !reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r) 								
								&& !$past(rwds_2x_latency_r) 
								&& (sel_r == 4'b1010) 
								&& (tacc_r == 15)
								&& (tpre_r == 2)
								&& (tpost_r == 5)								
								&& (dataw_r == 32'h78123456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]); 

	// READ MEMORY

    // try reading memory space - variable & single latency, shortest possible tacc = 2, no timeout
    if (f_past_valid)
        _rx_hmem_: cover(			!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& !read_timeout_r 
								&& (datar_r == 32'hfabc3456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try reading memory space - variable & single latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hmem_tacc4_: cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& !read_timeout_r 
								&& (datar_r == 32'hfabc3456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try reading memory space - variable & double latency, tacc = 5, tpre = 2, tpost = 3, no timeout
    if (f_past_valid)
        _rx_hmem_tacc5x2_tpre2_tpost3_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& !$past(double_latency_r)
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 5) 
								&& (tpre_r == 2)
								&& (tpost_r == 3)								
								&& !read_timeout_r 
								&& (datar_r == 32'hfabc3456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try reading memory space - fixed & single latency, tacc = 6, tpre = 3, tpost = 2, no timeout
    if (f_past_valid)
        _rx_hmem_fixedlatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& $past(fixed_latency_r) 
								&& !$past(double_latency_r)
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 6) 
								&& (tpre_r == 3)
								&& (tpost_r == 2)								
								&& !read_timeout_r 
								&& (datar_r == 32'hfabc3456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);  

    // try reading memory space - fixed & double latency, tacc = 6, tpre = 3, tpost = 2, no timeout
    if (f_past_valid)
        _rx_hmem_fixeddoublelatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& (tpre_r == 2)
								&& (tpost_r == 3)								
								&& !read_timeout_r 
								&& (datar_r == 32'hfabc3456) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);  
				

   // try reading memory space - variable & single latency, tacc = 4, timeout = 4
    if (f_past_valid)
        _rx_hmem_trmax4_: cover(	!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& (trmax_r == 4)
								&& read_timeout_r 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

   // try reading memory space - variable & single latency, tacc = 4, timeout = 20
    if (f_past_valid)
        _rx_hmem_trmax20_: cover(	!$past(rst_i) 
								&& !rst_i 
								&& !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& !reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& (trmax_r == 20)
								&& read_timeout_r 
								&& CA_r[2:0] 
								&& CA_r[44:16]); 							

	// READ REGISTER

    // try reading register space - variable & single latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hreg_tacc4_: cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& !read_timeout_r 
								&& (datar_r == 32'h0000f97c) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);   

    // try reading register space - variable & double latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hreg_tacc4x2_: cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& !$past(fixed_latency_r) 
								&& !$past(double_latency_r)
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& !read_timeout_r 
								&& (datar_r == 32'h0000f97c) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);  

    // try reading register space - variable & single latency, tacc = 4, tpre = 2, post = 5 no timeout
    if (f_past_valid)
        _rx_hreg_tacc4_tpre2_tpost5_: 
						cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& !$past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& (tpre_r == 2)
								&& (tpost_r == 5)
								&& !read_timeout_r 
								&& (datar_r == 32'h0000f97c) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);  

    // try reading register space - fixed & single latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hreg_fixedlatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& !$past(double_latency_r)
								&& $past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& !read_timeout_r 
								&& (datar_r == 32'h0000f97c) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);

    // try reading register space - fixed & double latency, tacc = 4, no timeout
    if (f_past_valid)
        _rx_hreg_fixeddoublelatency_: 
						cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& !read_timeout_r 
								&& (datar_r == 32'h0000f97c) 
								&& CA_r[2:0] 
								&& CA_r[44:16]);


    // try reading register space - fixed & double latency, tacc = 4, timeout = max
    if (f_past_valid)
        _rx_hreg_trmax_: 
						cover(		!$past(rst_i) 
								&& !rst_i && !$past(ready_o) 
								&& ready_o 
								&& read_op 
								&& reg_access 
								&& $past(fixed_latency_r) 
								&& $past(double_latency_r)
								&& !$past(rwds_2x_latency_r)
								&& (tacc_r == 4) 
								&& (trmax_r == 6'h1f)
								&& read_timeout_r 
								&& CA_r[2:0] 
								&& CA_r[44:16]);

	// clock input is changing every cycle
	if (f_past_valid && !rst_i) begin
		assert( clk_i == ~$past(clk_i) );
	end

	// timings always greater or equal to their mins
	if (f_past_valid && !rst_i) begin
		_tacc_gte_2_:	assert(tacc_r >= MIN_TACC);
		_trmax_gte_4_:	assert(trmax_r >= MIN_TIMEOUT);
	end

	// loading timings and settings
	if (f_past_valid && !rst_i) begin
		if (($past(bus_state_r) == S_IDLE) && (bus_state_r == S_PRE)) begin
			_tcsh_load_:	assert(tcsh_r == $past(tcsh_i));
			_tpre_load_:	assert(tpre_r == $past(tpre_i));
			_tpost_load_:	assert(tpost_r == $past(tpost_i));

			if ($past(trmax_i) >= MIN_TIMEOUT)
				_trmax_load_:	assert( trmax_r == $past(trmax_i) );
			else
				_trmax_past_:	assert( trmax_r == MIN_TIMEOUT );

			if ($past(tacc_i) >= MIN_TACC)
				_tacc_load_:	assert( tacc_r == $past(tacc_i) );
			else
				_tacc_past_:	assert( tacc_r == MIN_TACC );
			
			assert( fixed_latency_r == $past(fixed_latency_i) );
			assert( double_latency_r == $past(double_latency_i) );
		end
	end

	// DQ & DQ_oen
	if (f_past_valid && !rst_i) begin
		if ((bus_state_r == S_CA) || (bus_state_r == S_WRITE))
			_hb_dq_oen_: 	assert( !hb_dq_oen );			
		else
			_hb_dq_noen_:	assert( hb_dq_oen ); 

		if (bus_state_r == S_CA) begin
			assert( hb_dq_o == CA_r[8*cycle_cnt_r+7:8*cycle_cnt_r] );
/*			
			case (cycle_cnt_r)
				5: assert( hb_dq_o == CA_5 );
				4: assert( hb_dq_o == CA_4 );
				3: assert( hb_dq_o == CA_3 );
				2: assert( hb_dq_o == CA_2 );
				1: assert( hb_dq_o == CA_1 );
				0: assert( hb_dq_o == CA_0 );				
			endcase
*/			
		end

		if (bus_state_r == S_WRITE) begin
			assert( hb_dq_o == dataw_r[8*cycle_cnt_r+7:8*cycle_cnt_r] );
/*			
			case (cycle_cnt_r)
				3: assert( hb_dq_o == dataw_3 );
				2: assert( hb_dq_o == dataw_2 );
				1: assert( hb_dq_o == dataw_1 );
				0: assert( hb_dq_o == dataw_0 );
			endcase
*/			
		end
	end

	// RWDS, RWDS_oen
	if (f_past_valid && !rst_i) begin
		if ((bus_state_r == S_WRITE) && !reg_access)
			_hb_rwds_oen_: 	assert( !hb_rwds_oen );			
		else
			_hb_rwds_noen_:	assert( hb_rwds_oen ); 

		if (bus_state_r == S_WRITE) begin
			if (!reg_access) 
				_hb_rwds_o_sel_:	assert( hb_rwds_o == ~sel_r[cycle_cnt_r] );
			else
				_hb_rwds_o_low_:	assert( !hb_rwds_o );
		end
	end

	// rstn
	if (rst_i)
		_hb_rstn_active_: 		assert( !hb_rstn_o );
	else
		_hb_rstn_nactive_:		assert( hb_rstn_o );

	// csn, clk, clkn
	if (f_past_valid && !rst_i) begin
		if (bus_state_r == S_IDLE) begin
			_hb_csn_:			assert( hb_csn_o );
			_hb_clk_low_:		assert( !hb_clk_o );
			_hb_clkn_low_:		assert( hb_clkn_o );
			_hb_clk_clkn_:		assert( hb_clk_o == ~hb_clkn_o );
			if (clk_active) 
				_hb_clk_active_:	assert( hb_clk_o == ~$past(hb_clk_o) );
		end
	end

	// FSM transitions
	if (f_past_valid && $past(rst_i)) begin
		_idle_after_rst_:				assert( bus_state_r == S_IDLE );
	end
	if (f_past_valid && !rst_i) begin
		if ($past(bus_state_r) == S_IDLE)
			_idle_then_pre_: 			assert( (bus_state_r == S_IDLE) || (bus_state_r == S_PRE) );

		if ($past(bus_state_r) == S_PRE)
			_pre_then_ca_:				assert( (bus_state_r == S_PRE) || (bus_state_r == S_CA) );

		if ($past(bus_state_r) == S_CA)
			_ca_then_write_latency_: 	assert( (bus_state_r == S_CA) || ((bus_state_r == S_WRITE) && reg_access) || (bus_state_r == S_LATENCY) );

		if ($past(bus_state_r) == S_WRITE)
			_write_then_post_:			assert( (bus_state_r == S_WRITE) || (bus_state_r == S_POST) );

		if ($past(bus_state_r) == S_LATENCY)
			_latency_then_write_read_:	assert( (bus_state_r == S_LATENCY) || ((bus_state_r == S_WRITE) && !reg_access) || ((bus_state_r == S_READ) && read_op ) );

		if ($past(bus_state_r) == S_READ)
			_read_then_post_:			assert( (bus_state_r == S_READ) || (bus_state_r == S_POST) );

		if ($past(bus_state_r) == S_POST)
			_post_then_idle_:			assert( (bus_state_r == S_POST) || (bus_state_r == S_IDLE) );			
		
		if ($rose(clk_i) && ($past(cycle_cnt_r) == 0) && ($past(bus_state_r) != S_IDLE))
			_state_change_:			assert( bus_state_r != $past(bus_state_r) );	

		if ($rose(clk_i) && ($past(read_cnt_r) == 0) && ($past(bus_state_r) == S_READ))
			_exit_read_:			assert( bus_state_r == S_POST ); 

		if ($rose(clk_i) && ($past(bus_state_r) == S_IDLE) && ($past(cycle_cnt_r) == 0) && $past(busy_r))
			_start_hb_op_:			assert( bus_state_r == S_PRE );		
	end

	// cycle counter
	if (f_past_valid && !rst_i) begin
		if ($rose(clk_i) && ($past(bus_state_r) == bus_state_r) && (bus_state_r != S_IDLE))
			_cycle_cnt_:			assert( $past(cycle_cnt_r) == cycle_cnt_r + 1 );

		if ($rose(clk_i) && ($past(bus_state_r) == S_IDLE) && (bus_state_r == S_PRE))
			_load_cnt_pre_:				assert( cycle_cnt_r == tpre_r );

		if ($rose(clk_i) && ($past(bus_state_r) == S_PRE) && (bus_state_r == S_CA))
			_load_cnt_ca_:				assert( cycle_cnt_r == 5 );

		if ($rose(clk_i) && ($past(bus_state_r) == S_CA) && (bus_state_r == S_WRITE))
			_load_cnt_write_reg_:		assert( cycle_cnt_r == 1 );

		if ($rose(clk_i) && ($past(bus_state_r) == S_CA) && (bus_state_r == S_LATENCY)) begin
			if (fixed_latency_r)
				_load_cnt_fixed_latency_:		assert( cycle_cnt_r == 2 * (double_latency_r + 1) * tacc_r - 2 - !read_op);
			else
				_load_cnt_rwds_latency_:		assert( cycle_cnt_r == 2 * (rwds_2x_latency_r + 1) * tacc_r - 2 - !read_op);
		end

		if ($rose(clk_i) && ($past(bus_state_r) == S_LATENCY) && (bus_state_r == S_READ)) begin
			_load_cnt_read_tout_:			assert( cycle_cnt_r == 2 * trmax_r - 2 );
			if (reg_access)
				_load_rd_cnt_read_reg_:		assert( read_cnt_r == 2);
			else
				_load_rd_cnt_read_mem_:		assert( read_cnt_r == 4);
		end

		if ($rose(clk_i) && ($past(bus_state_r) == S_LATENCY) && (bus_state_r == S_WRITE))
			_load_cnt_write_mem_:			assert( cycle_cnt_r == 3 );
	
		if ($rose(clk_i) && (($past(bus_state_r) == S_WRITE) || ($past(bus_state_r) == S_READ)) && (bus_state_r == S_POST)) 
			_load_cnt_post_:				assert( cycle_cnt_r == tpost_r );

		if ($rose(clk_i) && ($past(bus_state_r) == S_POST) && (bus_state_r == S_IDLE))
			_load_cnt_idle_:				assert( cycle_cnt_r == tcsh_r );
	end

	// ready, busy_r
	if (f_past_valid && !rst_i) begin
		_busy_:		assert( ready_o != busy_r );

		if ($rose(clk_i) && ($past(bus_state_r) == S_IDLE) && ($past(valid_start) || !$past(ready_o)))
			_entering_busy_:		assert( !ready_o );

		if ((bus_state_r == S_IDLE) && ($past(bus_state_r) == S_POST))
			_exiting_busy_:			assert( ready_o );

		if (!$past(rst_i) && (bus_state_r == S_IDLE) && ($past(bus_state_r) == S_IDLE) && !$past(valid_start) && $past(ready_o))
			_ready_till_busop_:		assert( ready_o );

		if (bus_state_r != S_IDLE)
			_not_ready_:			assert( !ready_o );
	end
    
	// read_timeout_o
	if (f_past_valid && !rst_i) begin
		_read_timeout_o_:				assert( read_timeout_o == read_timeout_r );

		if (($past(bus_state_r) == S_READ) && (bus_state_r == S_POST)) begin 
			if (($past(cycle_cnt_r) == 0) && ($past(read_cnt_r) != 0))
				_read_timeout_1_:			assert( read_timeout_r );
			else
				_read_timeout_0_:			assert( !read_timeout_r );
		end

		if ((bus_state_r == S_CA) || (bus_state_r == S_LATENCY) || (bus_state_r == S_WRITE) || ((bus_state_r == S_READ) && $past(cycle_cnt_r)))
			_read_timeout_clr_:				assert( !read_timeout_r );
	end
    
	// data read
	if (f_past_valid && !rst_i) begin
		_data_o_:		assert( data_o == datar_r );

		if ((bus_clk_r != $past(bus_clk_r)) && (bus_state_r == S_READ) && ($past(bus_state_r != S_LATENCY)) && ($past(hb_rwds_i) || rwds_r)) begin
			_read_cnt_changing_:	assert( read_cnt_r + 1 == $past(read_cnt_r) );
		end

		if ((bus_state_r == S_READ) && ($past(hb_rwds_i) || rwds_r) && (read_cnt_r != $past(read_cnt_r))) begin
			if ($past(hb_dq_i))
				_data_hb_read_:		assert( $past(datar_r) != datar_r );
			
			case (read_cnt_r)
				3:	assert( datar_3 == $past(hb_dq_i) );
				2:	assert( datar_2 == $past(hb_dq_i) );
				1:	assert( datar_1 == $past(hb_dq_i) );
				0:	assert( datar_0 == $past(hb_dq_i) );
			endcase
		end
	end	

	// data write, sel, read_op, reg_access
	if (f_past_valid && !$past(rst_i) && !rst_i) begin
		if ($rose(clk_i) && ($past(bus_state_r) == S_IDLE) && $past(valid_start) && !busy_r) begin
			_store_data_wr_:	assert( dataw_r == $past(data_i) );
			_store_sel_:		assert( sel_r == $past(sel_i) );
			_store_reg_acc_:	assert( reg_access == $past(regspace_i) );
			_store_rd_wr_:		assert( read_op == ~$past(wren_i) );
		end
	end

end
`endif	
	
endmodule


