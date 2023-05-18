


module add_sub(add,a,b,result);

    input [15:0] a,b;
    input add;
    output[15:0] result;

	 assign result = (add)?(a-b) :(a+b);


endmodule
