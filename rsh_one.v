////////////////
////Thea Zhu///
///////////////

module rsh_one(a,b);

    parameter N = 4;
    input  [(2**N)-1:0] a;
    output reg[(2**N)-1:0] b;

    always @(*) begin
      {b[(2**N)-1],b[(2**N)-1-1:0]} = {a[(2**N)-1],a[(2**N)-1:1]};
    end 
endmodule