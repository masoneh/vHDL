////////////////
////Thea Zhu///
///////////////

`include "rsh_one.v"
module rsh_one_tb;
    parameter N = 4;
    reg  [(2**N)-1:0] a;
    wire[(2**N)-1:0] b;

    rsh_one a1(a,b);

    integer i;

    initial begin
        $dumpfile("rsh_one.vcd");
        $dumpvars(0,rsh_one_tb);
        a = 0;
        for(i=0; i<6; i=i+1) begin
           a = $random%20;
            #10;
        $display("a is %b, and then the result of 1 bit right shift is %b",a, b); 
        end 
    end

endmodule