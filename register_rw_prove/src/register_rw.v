`default_nettype none
// synchronous write
// asynchronous read
module register_rw
#(
	parameter WIDTH = 32,
	parameter DEFAULT_VALUE = 0
)
(
	input			rst,
	input 			clk,
	input			wren,
	input 	[WIDTH-1:0] 	data_in,
	output  [WIDTH-1:0] 	data_out
);

	reg [WIDTH-1:0] dffreg;
	
	always @(posedge clk) begin
		if (rst) begin
			dffreg <= DEFAULT_VALUE;
		end
		else if (wren) begin
			dffreg <= data_in;
		end
	end

	assign data_out = dffreg;


	`ifdef FORMAL

	// register for knowing if we have just started
	reg f_past_valid = 0;
	
	// start in reset
	initial assume(rst);

	always @(posedge clk) begin
        
        // update past_valid reg so we know it's safe to use $past()
        f_past_valid <= 1;

		if (f_past_valid)
		cover(data_out && !rst);
	    
		if (f_past_valid)
		cover(~|data_out && $past(data_out) && !$past(rst) && !rst);

        // load works
		if (f_past_valid)
			if ($past(wren) && !wren && !$past(rst))
				_load_: assert(data_out == $past(data_in));
			// remember value
			if (f_past_valid)
				if (!$past(wren) && !wren && !$past(rst))
					_remember_: assert(data_out == $past(data_out));
		end
	`endif

	
endmodule


