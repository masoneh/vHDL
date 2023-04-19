//N-bit ALU///
//Thea Zhu///

module ALU(Ain, Bin,mode, result);
 
 parameter N1 = 8;
 input [N1*8-1:0] Ain, Bin;
 input [2:0] mode;
 output reg [N1*8-1:0] result;
 
 
//  wire [N1*8-1:0] tmp;
//  assign tmp = {1'b0,Ain} +{1'b0,Bin};

//  output reg overflow = tmp[N1*8];
 


integer i;
always @(*) begin
        for (i = 0; i<N1; i=i+1) begin
                case(mode)
				    3'b000: // addition
					    result[i*N1 +: N1]= Ain[i*N1 +: N1] + Bin[i*N1 +: N1];
				    3'b001: //subtraction
					    result[i*N1 +: N1+1] = Ain[i*N1 +: N1] - Bin[i*N1+: N1];
				    3'b010: //logical AND
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1] & Bin[i*N1 +: N1]; 
				    3'b011: //logical OR
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1] | Bin[i*N1 +: N1];
				    3'b100: //logical XOR
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1] ^ Bin[i*N1 +: N1];
				    3'b101: //logical shift left
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1]<< 1;
				    3'b110:// logical shift right
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1] >> 1;
				    default:
					    result [i*N1 +: N1+1] = Ain[i*N1 +: N1] + Bin[i*N1 +: N1];
			    endcase
        end
        // for(i = 0; i< N1; i=i+1) begin
			


end



endmodule

