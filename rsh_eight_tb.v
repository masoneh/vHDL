////////////////
////Thea Zhu///
///////////////

`include "rsh_eight.v"
module rsh_eight_tb;
    parameter N = 4;
    reg  [(2**N)-1:0] a;
    wire [(2**N)-1:0] b;

    rsh_eight a3(a,b);

    integer i;

    initial begin
        $dumpfile("rsh_eight.vcd");
        $dumpvars(0,rsh_eight_tb);
        a = 0;
        for(i=0; i<6; i=i+1) begin
           a = $random%20;
            #10;
        $display("a is %b, and then the result of 8 bit right shift is %b",a, b); 
        end 
    end

endmodule