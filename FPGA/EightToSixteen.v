module EightToSixteen(reset, clk, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7);
	input [7:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
	output reg [15:0] NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7;
	input clk;
	input reset;
	
	always @(posedge clk)
	begin
		if(reset == 1'b1) begin
			NewQ0 = 16'b0;
			NewQ1 = 16'b0;
			NewQ2 = 16'b0;
			NewQ3 = 16'b0;
			NewQ4 = 16'b0;
			NewQ5 = 16'b0;
			NewQ6 = 16'b0;
			NewQ7 = 16'b0;
		end
		else begin
			NewQ0 = 8'b00000000 + Q0;
			NewQ1 = 8'b00000000 + Q1;
			NewQ2 = 8'b00000000 + Q2;
			NewQ3 = 8'b00000000 + Q3;
			NewQ4 = 8'b00000000 + Q4;
			NewQ5 = 8'b00000000 + Q5;
			NewQ6 = 8'b00000000 + Q6;
			NewQ7 = 8'b00000000 + Q7;
		end
	end
	
endmodule