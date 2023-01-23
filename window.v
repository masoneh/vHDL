`include "constants.vams"

module window(input_function, coefficients, new_function);

    parameter size = 128;
    parameter arg = `M_TWO_PI / size;
    input [size-1:0][7:0] input_function;
    output [size-1:0][7:0] new_function; 
    reg [size-1:0][7:0] new_function;
    output [size-1:0][7:0] coefficients;
    reg [size-1:0][7:0] coefficients;
    integer i;
    integer j;

    initial 
        begin
            //populate coefficients matrix
            for(i=0; i<size; i=i+1) begin 
                coefficients[i] = (0.54 - (0.46 * $cos(arg * (i+0.5)))) * 100;
            end
        end

    always@(input_function)
        begin 
            // apply hamming window to input  
            for(j=0; j<size; j=j+1) begin
                new_function[j] = coefficients[j] * input_function[j];
            end 
        end

endmodule