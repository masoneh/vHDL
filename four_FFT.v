module four_FFT(a,b,c,d,Ar,Br,Cr,Dr,Ai,Bi,Ci,Di);
    input [3:0] a,b,c,d;
    output [5:0] Ar,Br,Cr,Dr,Ai,Bi,Ci,Di;

    assign Ar = a+b+c+d;
    assign Ai = 0;
    assign B = a-c;
    assign Bi = d-b;
    assign C = a+c-b-d;
    assign Ci = 0;
    assign D = a-c;
    assign Di = b-d;
endmodule



