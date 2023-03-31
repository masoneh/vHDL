///////////////
////Thea Zhu///
///////////////


//DFF with clock enable 


module DFF_colck_enable(d,clk,en,q);
	/* 
	d determines the next value of the output. the output doesn't change 
	unitl the next rising edge of the clock. 
	
	clk determines when the output will change. the output changes when a rising edge of
	the clk is detected.
	
	q is output and stored value
	
	
	*/

	input d,clk,en;

	output reg q;
	
	initial begin
		q = 0;
	end
	
	always @(posedge clk) begin
		 if (en) begin
			  q <=d;
		 end
		 else begin
			  q <=q;
		 end
	end
endmodule
		  
	
