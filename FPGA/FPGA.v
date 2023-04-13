///////////////
////Thea Zhu///
///////////////


module FPGA (bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7,clk,rst, output_re, output_im,index);

		input bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7;
		input clk,rst;
		output [15:0] output_re, output_im;	
		output [2:0] index;
		
		wire [63:0] out;
		wire [7:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
		wire [15:0] NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7;
		wire [15:0] y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7;
		wire [63:0] new_function;
		
		
		sample_to_bus sb(clk, rst, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, out);
		
		
		Window wf(out, new_function, clk, rst);
		SerialToParallel s2p(new_function, clk, rst, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);
		
		EightToSixteen e2s(rst, clk, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7);
		
		eight_pt_fft fft(NewQ0, NewQ1, NewQ2, NewQ3, NewQ4, NewQ5, NewQ6, NewQ7,clk,rst,
                    y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7);
		
		fft_output fo(y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7,
					clk, output_re, output_im, index);
endmodule


		
		