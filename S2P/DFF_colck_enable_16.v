///////////////
////Thea Zhu///
///////////////


//DFF with clock enable with 16 bit 


module DFF_colck_enable_16(a,clk,en,y);
	
	parameter N = 4;
	input [(2**N)-1:0] a;
	input clk,en;
	output[(2**N)-1:0] y;
	 
	DFF_colck_enable d1(y[0],clk,en,a[0]);
	DFF_colck_enable d2(y[1],clk,en,a[1]);
	DFF_colck_enable d3(y[2],clk,en,a[2]);
	DFF_colck_enable d4(y[3],clk,en,a[3]);
	DFF_colck_enable d5(y[4],clk,en,a[4]);
	DFF_colck_enable d6(y[5],clk,en,a[5]);
	DFF_colck_enable d7(y[6],clk,en,a[6]);
	DFF_colck_enable d8(y[7],clk,en,a[7]);
	DFF_colck_enable d9(y[8],clk,en,a[8]);
	DFF_colck_enable d10(y[9],clk,en,a[9]);
	DFF_colck_enable d11(y[10],clk,en,a[10]);
	DFF_colck_enable d12(y[11],clk,en,a[11]);
	DFF_colck_enable d13(y[12],clk,en,a[12]);
	DFF_colck_enable d14(y[13],clk,en,a[13]);
	DFF_colck_enable d15(y[14],clk,en,a[14]);
	DFF_colck_enable d16(y[15],clk,en,a[15]);

endmodule