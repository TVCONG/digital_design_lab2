`timescale 10ps/1ps

module testbench();
	reg [7:0] x,y;
	reg c_in;
	wire c_out;
	wire [7:0] s;
	
	CLA_8bit cla(.x(x), .y(y), .c_in(c_in), .c_out(c_out),.s(s));
	// directly test 
	initial
	begin
		x=8'd3;
		y=8'd5;
		c_in=0;
		#10;
		x=8'd8;
		y=8'd9;
		c_in=1;
		#10;
		x=8'd7;
		y=8'd5;
		c_in=1;
		#10;
		x=8'b00000000;
		y=8'b00000000;
		c_in=0;
		#10;
	end
	// golden output 
	reg [7:0] golden_s;
	reg golden_out;
	always @(x or y or c_in) 
	begin 
		case({x,y,c_in})
			{8'd3, 8'd5, 1'b0} : {golden_s, golden_out} = {8'd8, 1'b0};
			default: {golden_s, golden_out} = {8'd8, 1'b0};
		endcase
	end
endmodule
