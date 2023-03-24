module ParallelToSerial(d, serialout, select, clk, reset);
	input [7:0] d;
	input select, clk, reset;
	reg [7:0] q;
	output reg serialout;
	
	always @(posedge clk)
	begin
		if(reset==1'b1) begin
			q<=8'b00000000;
		end
		else if (select==1'b0) begin
			q <= d;
		end 
		else begin
			serialout <= q[0];
			q <= q>>1;
		end
	end
endmodule 