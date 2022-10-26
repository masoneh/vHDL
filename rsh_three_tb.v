////////////////
////Thea Zhu///
///////////////

`include "rsh_three.v"
module rsh_three_tb;
    parameter N = 4;
    reg  [(2**N)-1:0] a;
    wire [(2**N)-1:0] b;

    rsh_three a3(a,b);

    integer i;

    initial begin
        $dumpfile("rsh_three.vcd");
        $dumpvars(0,rsh_three_tb);
        a = 0;
        for(i=0; i<6; i=i+1) begin
           a = $random%20;
            #10;
        $display("a is %b, and then the result of 3 bit right shift is %b",a, b); 
        end 
    end

endmodule