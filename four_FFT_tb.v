`include "four_FFT.v"
module four_FFT_tb;
    reg [3:0] a,b,c,d;
    wire [5:0] Ar,Br,Cr,Dr,Ai,Bi,Ci,Di;
    four_FFT f1(.a(a),.b(b),.c(c),.d(d),.Ar(Ar),.Br(Br),.Cr(Cr),.Dr(Dr),.Ai(Ai),.Bi(Bi),.Ci(Ci),.Di(Di));
    
    initial
        begin
            $dumpfile("four_FFT.vcd");
            $dumpvars(0,four_FFT_tb);

            a = 3'd0; b = 3'd1; c = 3'd2; d=3'd3;
            // //output Ar=6,Br=-2,Cr=-2,Dr=-2,Ai=0,Bi=2,Ci=0,Di=-2
            #10
            a = 3'd0; b = 3'd1; c = 3'd2; d=3'd3;
            // $display("a ", a);
            //  $display("c ", c);
            //   $display("a-c ", a-c);
            
        end
endmodule
          
        




