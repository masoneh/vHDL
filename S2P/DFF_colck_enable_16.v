///////////////
////Thea Zhu///
///////////////


//DFF with clock enable with 16 bit 


module DFF_clock_enable_16(a,clk,en,y);
	
	parameter N = 4;
	input [(2**N)-1:0] a;
	input clk,en;
	output[(2**N)-1:0] y;
	
	 
	DFF_colck_enable d1(a[0],clk,en,y[0]);
	DFF_colck_enable d2(a[1],clk,en,y[1]);
	DFF_colck_enable d3(a[2],clk,en,y[2]);
	DFF_colck_enable d4(a[3],clk,en,y[3]);
	DFF_colck_enable d5(a[4],clk,en,y[4]);
	DFF_colck_enable d6(a[5],clk,en,y[5]);
	DFF_colck_enable d7(a[6],clk,en,y[6]);
	DFF_colck_enable d8(a[7],clk,en,y[7]);
	DFF_colck_enable d9(a[8],clk,en,y[8]);
	DFF_colck_enable d10(a[9],clk,en,y[9]);
	DFF_colck_enable d11(a[10],clk,en,y[10]);
	DFF_colck_enable d12(a[11],clk,en,y[11]);
	DFF_colck_enable d13(a[12],clk,en,y[12]);
	DFF_colck_enable d14(a[13],clk,en,y[13]);
	DFF_colck_enable d15(a[14],clk,en,y[14]);
	DFF_colck_enable d16(a[15],clk,en,y[15]);

endmodule

