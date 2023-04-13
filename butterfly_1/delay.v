////////////////
////Thea Zhu///
///////////////


module delay(a,clk,rst,b);

	parameter N = 4;
	
	input [(2**N)-1:0] a;
	output [(2**N)-1:0] b;
	input clk,rst;
	wire [(2**N)-1:0] a1,a2,a3,a4;
	
	 reg_n f1(a,clk,rst,a1);
	 reg_n f2(a1,clk,rst,a2);
	 reg_n f3(a2,clk,rst,a3);
	 reg_n f4(a3,clk,rst,a4);
	 reg_n f5(a4,clk,rst,b);

endmodule
