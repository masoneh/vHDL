////////////////
////Thea Zhu///
///////////////

//`include "dff.v"

module reg_n(d,clk,rst,q);

    parameter N = 4;
    input [(2**N)-1:0] d;
    input clk,rst;
    output [(2**N)-1:0] q;


    D_ff dff0(d[0],rst,clk,q[0]);
    D_ff dff1(d[1],rst,clk,q[1]);
    D_ff dff2(d[2],rst,clk,q[2]);
    D_ff dff3(d[3],rst,clk,q[3]);
    D_ff dff4(d[4],rst,clk,q[4]);
    D_ff dff5(d[5],rst,clk,q[5]);
    D_ff dff6(d[6],rst,clk,q[6]);
    D_ff dff7(d[7],rst,clk,q[7]);
    D_ff dff8(d[8],rst,clk,q[8]);
    D_ff dff9(d[9],rst,clk,q[9]);
    D_ff dff10(d[10],rst,clk,q[10]);
    D_ff dff11(d[11],rst,clk,q[11]);
    D_ff dff12(d[12],rst,clk,q[12]);
    D_ff dff13(d[13],rst,clk,q[13]);
    D_ff dff14(d[14],rst,clk,q[14]);
    D_ff dff15(d[15],rst,clk,q[15]);

endmodule  