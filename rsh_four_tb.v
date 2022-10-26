////////////////
////Thea Zhu///
///////////////

`include "rsh_four.v"
module rsh_four_tb;
    parameter N = 3;
    reg  [(2**N)-1:0] a;
    wire [(2**N)-1:0] b;

    rsh_four a4(a,b);

    integer i;

    initial begin
        $dumpfile("rsh_four.vcd");
        $dumpvars(0,rsh_four_tb);
        a = 0;
        for(i=0; i<6; i=i+1) begin
           a = $random%20;
            #10;
        $display("a is %b, and then the result of 4 bit right shift is %b",a, b); 
        end 
    end

endmodule