////////////////
////Thea Zhu///
///////////////


module add_sub(add,a,b,result);
    parameter N = 4;
    input [(2**N)-1:0] a,b;
    input add;
    output reg[(2**N)-1:0] result;

    always @(*) begin
        if(add) begin
          result = a+b; //add = 0 is adder, 
        end
        else begin
          result = a-b;//add =1 is subtractor 
        end
    end


endmodule
