module SerialToParallel(D, clk, reset, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);
	input D; 
	input clk; //rising edge D flip flop
	input reset;
	output reg Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
	
	always @(posedge clk) 
	begin
		if(reset==1'b1) begin 
			Q0<=1'b0;
			Q1<=1'b0;
			Q2<=1'b0;
			Q3<=1'b0;
			Q4<=1'b0;
			Q5<=1'b0;
			Q6<=1'b0;
			Q7<=1'b0;
		end 
		else begin 
			Q0 <= D;
			Q1 <= Q0;
			Q2 <= Q1;
			Q3 <= Q2;
			Q4 <= Q3;
			Q5 <= Q4;
			Q6 <= Q5;
			Q7 <= Q6;
		end
	end
endmodule 
	
