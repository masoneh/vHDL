`timescale 100ns / 100ns
`include "constants.vams"

module Window_tb;

	parameter size = 8;
	parameter arg = `M_TWO_PI / size;
	reg[size*8-1:0] input_function;
	reg[size*8-1:0] coefficients; 
	wire[size*8-1:0] new_function;
	integer i;
	integer k;
	
	Window uut(input_function, new_function, coefficients);
	
	initial begin
	
		$dumpfile("Window_tb.vcd"); //incarus only 
		$dumpvars(0, Window_tb); //incarus only 
		
		//for loop to populate input_function with al 1s
		for(k=0; k<size; k=k+1) begin
			input_function[k*8 +: 8] = 1;
		end
		
		//for loop to populate coefficients array 
		for(i=0; i<size; i=i+1) begin
			coefficients[i*8 +: 8] = (0.54 - (0.46 * -$cos(arg * (i+0.5)))) * 100;
		end
		
		#10000
		
		$display("Test Complete");

      end

endmodule 
