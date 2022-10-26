//8-bit ALU///
//Thea Zhu///

module ALU(Ain, Bin,mode,result);
	input [7:0] Ain, Bin;
	input [2:0] mode;
	output reg[15:0] result;




	always @(*)
	begin
			case(mode)
				3'b000: // addition
					result = Ain + Bin;
				3'b001: //subtraction
					result = Ain - Bin;
				3'b010: //logical AND
					result = Ain & Bin; 
				3'b011: //logical OR
					result = Ain | Bin;
				3'b100: //logical XOR
					result = Ain ^ Bin;
				3'b101: //logical shift left
					result = Ain << 1;
				3'b110:// logical shift right
					result = Ain >> 1;  
				default:
					result = Ain + Bin;
			endcase
	end 
endmodule







	
	



	
	

			
				