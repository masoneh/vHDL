module fft_output(y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7,
					fastclk, output_re, output_im, index);

input fastclk;
input [15:0] y0,yr1,yi1,yr2,yi2,yr3,yi3,y4,yr5,yi5,yr6,yi6,yr7,yi7;	//testing with 8 bits, replace with 16 when combining
output reg [15:0] output_re, output_im;	//testing with 8 bits, replace with 16 when combining
output reg [2:0] index;

reg slowclk;
reg [2:0] output_count = 0;
reg[25:0] counter = 0;
integer clk_count = 50000000;

always @ (posedge fastclk) begin // clock divider module, setting slowclk to 1MHz
counter <= counter + 1;
    case(counter)
		clk_count:
			begin 
				slowclk <= ~slowclk;
            counter <= 0;
			end
    endcase

end
				
always@(posedge slowclk) begin
	case(output_count)
		0:
			begin
				output_re = y0;
				output_im = 0;
				index = 0;
				output_count = output_count + 1;
			end
		1:
			begin
				output_re = yr1;
				output_im = yi1;
				index = 1;
				output_count = output_count + 1;
			end
		2:
			begin
				output_re = yr2;
				output_im = yi2;
				index = 2;
				output_count = output_count + 1;
			end
		3:
			begin
				output_re = yr3;
				output_im = yi3;
				index = 3;
				output_count = output_count + 1;
			end
		4:
			begin
				output_re = y4;
				output_im = 0;
				index = 4;
				output_count = output_count + 1;
			end
		5:
			begin
				output_re = yr5;
				output_im = yi5;
				index = 5;
				output_count = output_count + 1;
			end
		6:
			begin
				output_re = yr6;
				output_im = yi6;
				index = 6;
				output_count = output_count + 1;
			end
		7:
			begin
				output_re = yr7;
				output_im = yi7;
				index = 7;
				output_count = 0;
			end
	endcase
end

endmodule