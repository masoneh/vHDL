////////////////
////Thea Zhu///
///////////////


// stupid code with stupid testbench 

`timescale 1ns / 1ps
`include "fft_16.v"

module fft_16_tb;

    reg clk, reset;
    reg [15:0] x_real, x_imag;
    wire [15:0] y_real, y_imag;

    fft_16 f1 (
        .clk(clk),
        .reset(reset),
        .x_real(x_real),
        .x_imag(x_imag),
        .y_real(y_real),
        .y_imag(y_imag)
    );

    initial begin
        $dumpfile("fft_16_test.vcd");
        $dumpvars(0,fft_16_tb);

        x_real = 16'h0001;
        x_imag = 16'h0002;


        reset = 1;
        clk = 1;
        #1;
        reset = 0;


        #100;

        $display("Input:");
        $display("x_real = %h", x_real);
        $display("x_imag = %h", x_imag);

        
        #100;
  
        $display("Output:");
        $display("y_real = %h", y_real);
        $display("y_imag = %h", y_imag);

      
        #100;
        $finish;
    end


    always #5 clk = ~clk;

endmodule
