`timescale 10ps/1ps

module testbench();
	parameter NUMBER_32bit = 4294967295;
	reg [31:0] in1, in2;
	reg [2:0] opcode;

	wire [31:0] cur_out;
	ALU alu(
		.in1(in1),
		.in2(in2),
		.opcode(opcode),
		.out(cur_out)
		);
	// random test
	integer i;
	parameter NUM_LOOP = 100;	
	initial 
	begin
		//phep cong
		opcode = 3'b000;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// phep tru 
		opcode = 3'b001;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// NOT_A
		opcode = 3'b010;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// A and B
		opcode = 3'b011;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// A or B
		opcode = 3'b100;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// A xor B
		opcode = 3'b101;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// dich trai A 1 bit
		opcode = 3'b110;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;
		// dich phai A 1 bit
		opcode = 3'b111;
		in1 = 32'd2000;
		in2 = 32'd1000;
		#10;

	/*
		for (opcode = 0;opcode < 8; opcode=opcode+1)
			for (in1 = 0; in1 < NUMBER_32bit; in1 = in1 + 1)
				for (in2 = 0; in2 < NUMBER_32bit; in2 = in2 + 1)
		for (i = 0; i < NUM_LOOP; i = i + 1)begin
			opcode = $random();
			in1 = $random();
			in2 = $random();
		#10;
		end
*/
	end
	//generate golden output
	reg [31:0] golden_out;
	always @(in1 or in2 or opcode)
	begin
		case (opcode)
			3'b000: golden_out = 3000;
			3'b001: golden_out = 1000;
			3'b010: golden_out = 4294965295;
			3'b011: golden_out = 960;
			3'b100: golden_out = 2040;
			3'b101: golden_out = 1080;
			3'b110: golden_out = 4000;
			3'b111: golden_out = 1000;
		endcase
		
		/*
		case (opcode)
		3'b000: golden_out = in1 + in2;
		3'b001: golden_out = in1 - in2;
		3'b010: golden_out = ~in1; // not A
		3'b011: golden_out = in1 & in2;
		3'b100: golden_out = in1 | in2;
		3'b101: golden_out = in1 ^ in2;
		3'b110: golden_out = in1 << 1; // dich trai in1 1 bit
		3'b111: golden_out = in1 >> 1; 
 		default : golden_out = 8'h0000;
	endcase
*/
	end
	//compare 
	initial
	begin
		$monitor("%t-%b: golden_out=%d, out=%d",
			$time,(golden_out==cur_out), golden_out, cur_out);
	end
	
endmodule