//8-bit ALU///
//Thea Zhu///

`include "ALU.v"
module ALU_tb;
	reg [7:0] Ain,Bin;
	reg [2:0] mode;
	wire [15:0] result;
	ALU a1(Ain,Bin,mode,result);

	initial 
		begin
			$dumpfile("ALU.vcd");
            $dumpvars(0,ALU_tb);

			Ain = 8'h33;Bin = 8'h44; mode = 3'd0;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd1;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd2;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd3;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd4;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd5;
			#10;
			Ain = 8'h33;Bin = 8'h44; mode = 3'd7;
			#10;
		end
endmodule
	