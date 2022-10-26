////////////////
////Thea Zhu///
///////////////

`include "rsh_six.v"
module rsh_six_tb;
    parameter N = 4;
    reg  [(2**N)-1:0] a;
    wire [(2**N)-1:0] b;

    rsh_six a4(a,b);

    integer i;

    initial begin
        $dumpfile("rsh_six.vcd");
        $dumpvars(0,rsh_six_tb);
        a = 0;
        for(i=0; i<6; i=i+1) begin
           a = $random%20;
            #10;
        $display("a is %b, and then the result of 6 bit right shift is %b",a, b); 
        end 
    end

endmodule