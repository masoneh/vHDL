module fft_output(y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7,
					fastclk, output_clk, output_re, output_im);

input fastclk;
input [7:0] y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7;	//testing with 8 bits, replace with 16 when combining
output reg [7:0] output_re, output_im;	//testing with 8 bits, replace with 16 when combining
output reg output_clk;

reg [2:0] output_count = 0;
reg[4:0] counter = 0;
integer clk_count = 25;

always @ (posedge fastclk) begin // clock divider module, setting slow clk to 1MHz
counter <= counter + 1;
    case(counter)
		clk_count:
			begin 
				output_clk <= ~output_clk;
            counter <= 0;
			end
    endcase

end
				
always@(posedge output_clk) begin
	case(output_count)
		0:
			begin
				output_re = y0;
				output_im = 0;
				output_count = output_count + 1;
			end
		1:
			begin
				output_re = yr1;
				output_im = yi1;
				output_count = output_count + 1;
			end
		2:
			begin
				output_re = yr2;
				output_im = yi2;
				output_count = output_count + 1;
			end
		3:
			begin
				output_re = yr3;
				output_im = yi3;
				output_count = output_count + 1;
			end
		4:
			begin
				output_re = y4;
				output_im = 0;
				output_count = output_count + 1;
			end
		5:
			begin
				output_re = yr5;
				output_im = yi5;
				output_count = output_count + 1;
			end
		6:
			begin
				output_re = yr6;
				output_im = yi6;
				output_count = output_count + 1;
			end
		7:
			begin
				output_re = yr7;
				output_im = yi7;
				output_count = 0;
			end
	endcase
end

endmodule
			

	