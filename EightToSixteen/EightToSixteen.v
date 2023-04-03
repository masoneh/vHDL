module EightToSixteen(clk, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7);
	input [7:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
	output reg [15:0] NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7;
	input clk;
	
	always @(posedge clk)
	begin
		NewQ0 = 8'b00000000 + Q0;
		NewQ1 = 8'b00000000 + Q1;
		NewQ2 = 8'b00000000 + Q2;
		NewQ3 = 8'b00000000 + Q3;
		NewQ4 = 8'b00000000 + Q4;
		NewQ5 = 8'b00000000 + Q5;
		NewQ6 = 8'b00000000 + Q6;
		NewQ7 = 8'b00000000 + Q7;
	end
	
endmodule
