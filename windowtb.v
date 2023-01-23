`timescale 1ns / 1ns
`include "window.v"
`include "constants.vams"

module windowtb;

    parameter size = 128;
    parameter arg = `M_TWO_PI / size;
    reg[size-1:0][7:0] input_function;
    wire[size-1:0][7:0] new_function;
    wire[size-1:0][7:0] coefficients;
    integer k;

    window uut(input_function, coefficients, new_function);

    initial begin

        $dumpfile("windowtb.vcd");
        $dumpvars(0, windowtb);

        //for loop to populate input_function with all 1s 
        for(k=0; k<size; k=k+1) begin  
            input_function[k] = 2;
        end
        #1000

        $display("Test Complete");

    end

endmodule 

