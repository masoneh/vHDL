///////////////
////Thea Zhu///
///////////////

//`include "DFF_colck_enable.v"

//Serial to Parallel Conversion


module S2P(a,clk,en,y1,y2,y3,y4,y5,y6,y7,y8);
		
			parameter N = 4;
			
			input [(2**N)-1:0]a;
			input clk,en;	
			
			//y1 is MSB, y8 is LSB
			output [(2**N)-1:0] y1,y2,y3,y4,y5,y6,y7,y8; 
			
			//DFF_colck_enable(d,clk,en,q);
			
			DFF_colck_enable d1(a, clk, en, y1);
			DFF_colck_enable d2(y1, clk, en, y2);
			DFF_colck_enable d3(y2, clk, en, y3);
			DFF_colck_enable d4(y3, clk, en, y4);
			DFF_colck_enable d5(y4, clk, en, y5);
			DFF_colck_enable d6(y5, clk, en, y6);
			DFF_colck_enable d7(y6, clk, en, y7);
			DFF_colck_enable d8(y7, clk, en, y8);
	
endmodule
