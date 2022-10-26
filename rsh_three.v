////////////////
////Thea Zhu///
///////////////

module rsh_three(a,b);

    parameter N = 4;
    input  [(2**N)-1:0] a;
    output reg[(2**N)-1:0] b;

    always @(*) begin
        {b[(2**N)-1:(2**N)-1-3],b[(2**N)-1-1-3:0]} = {a[(2**N)-1],a[(2**N)-1],a[(2**N)-1],a[(2**N)-1:3]};
    end 
endmodule