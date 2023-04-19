
//N-bit ALU///
//Thea Zhu///

`include "ALU.v"
module ALU_tb;
    parameter N1 = 8;
	reg [N1*8-1:0] Ain,Bin;
	reg [2:0] mode;
	wire [N1*8-1:0] result;
	ALU a1(Ain,Bin,mode,result);

	initial 
		begin
			$dumpfile("ALU.vcd");
            $dumpvars(0,ALU_tb);

			Ain = 8'h44;Bin = 8'h33; mode = 3'd0;
            //$display (Ain+Bin);
			#10;
			Ain = 8'h44;Bin = 8'h33; mode = 3'd1;
            //$display (Ain - Bin);
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
