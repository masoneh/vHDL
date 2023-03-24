`include "constants.vams"

module Window(input_function, new_function, coefficients);

    parameter size = 8;
    parameter arg = `M_TWO_PI / size;
    input [size*7-1:0] input_function;
    output [size*7-1:0] new_function; 
    reg [size*7-1:0] new_function;
	 input [size*7-1:0] coefficients;
	 integer j;

	 generate 
    always@(input_function)
        begin 
            // apply hamming window to input  
            for(j=0; j<size; j=j+1) begin
                new_function[j*7 +: 7] = coefficients[j*7 +: 7] * input_function[j*7 +: 7];
            end 
        end
	 endgenerate

endmodule
