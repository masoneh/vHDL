///////////////
////Thea Zhu///
///////////////

//`include "DFF_colck_enable_16.v"

//Serial to Parallel Conversion


module S2P(a,clk,en,y1,y2,y3,y4,y5,y6,y7,y8);
		
			parameter N = 4;
			
			input [(2**N)-1:0]a;
			input clk,en;	
			
			//y1 is MSB, y8 is LSB
			output [(2**N)-1:0] y1,y2,y3,y4,y5,y6,y7,y8; 
			
			//DFF_clock_enable_16(a,clk,en,y)
			
			DFF_clock_enable_16 d1 (a, clk, en, y1);
			DFF_clock_enable_16 d2 (y1, clk, en, y2);
			DFF_clock_enable_16 d3 (y2, clk, en, y3);
			DFF_clock_enable_16 d4 (y3, clk, en, y4);
			DFF_clock_enable_16 d5 (y4, clk, en, y5);
			DFF_clock_enable_16 d6 (y5, clk, en, y6);
			DFF_clock_enable_16 d7 (y6, clk, en, y7);
			DFF_clock_enable_16 d8 (y7, clk, en, y8);
	
endmodule



