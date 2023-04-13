`include "constants.vams"

module Window(input_function, new_function, clk, rst);
    parameter size = 8;
    parameter arg = `M_TWO_PI / size;
    input [size*8-1:0] input_function;
    output [size*8-1:0] new_function; 
    reg [size*8-1:0] new_function;
    reg [size*8-1:0] coefficients;
    integer j;
    integer i; 
    input clk;
    input rst;

        always@(posedge clk) begin
				//calculate coefficients array
				coefficients[7:0] = 8'b00001000;
				coefficients[15:8] = 8'b00010101;
				coefficients[23:16] = 8'b00110110;
				coefficients[31:24] = 8'b01010110;
				coefficients[39:32] = 8'b01100100;
				coefficients[47:40] = 8'b01010110;
				coefficients[55:48] = 8'b00110110;
				coefficients[63:56] = 8'b000010101;
            // apply hamming window to input			
            for(j=0; j<size; j=j+1) begin
                new_function[j*8 +: 8] = coefficients[j*8 +: 8] * input_function[j*8 +: 8];
            end
        end
endmodule