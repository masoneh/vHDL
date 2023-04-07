module SerialToParallel(D, clk, reset, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);
	input [63:0] D; 
	input clk; //rising edge D flip flop
	input reset;
	output reg [7:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
	
	always @(posedge clk) 
	begin
		if(reset==1'b1) begin 
			Q0 = 8'h00;
			Q1 = 8'h00;
			Q2 = 8'h00;
			Q3 = 8'h00;
			Q4 = 8'h00;
			Q5 = 8'h00;
			Q6 = 8'h00;
			Q7 = 8'h00;
		end 
		else begin 
			Q0 = D[7:0];
			Q1 = D[15:8];
			Q2 = D[23:16];
			Q3 = D[31:24];
			Q4 = D[39:32];
			Q5 = D[47:40];
			Q6 = D[55:48];
			Q7 = D[63:56];
		end
	end
endmodule