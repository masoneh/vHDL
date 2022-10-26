`timescale 1ns/1ns
`include "fft.v"

module ffttest;

reg [7:0] TDin;  // Time domain sampled waveform 
wire [7:0] FDout; // Frequency domain output 

fft uut(FDout, TDin);

initial
    begin
        $dumpfile("ffttest.vcd");
        $dumpvars(0,ffttest);


        TDin = 01234567;
    end

endmodule
