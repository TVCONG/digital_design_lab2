
module full_adder(
	input reg x,y,
	input reg c_in,
	output reg c_node,
	output reg s 
);
	//wire c;
	always @(x & y & c_in) begin
		assign c_node = (c_in & x) ^(c_in & y) ^ (x & y);
		assign s = x ^ y ^ c_in;
	end

endmodule 
