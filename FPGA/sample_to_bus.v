module sample_to_bus(fastclk, reset, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, out);

input fastclk; //FPGA 50 mHz clk
input reset; // reset
input bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7; // 1 bit inputs 
output reg [63:0] out; // 64-bit bus comprised of 8 samples



reg slow_clk; //slow clk bit
reg [7:0] samplebuf; // reg to store each sample
reg [2:0] count; // count to track num of samples entered
reg [10:0] counter; // clock divider counter
integer num = 1667; // change this to change slow clk freq

always @ (posedge fastclk) begin // clock divider module, setting slow clk to 15 kHz
counter <= counter + 1;
    case(counter)
    num: begin slow_clk <= ~slow_clk;
                counter <= 0;
    end
    endcase
end

		always @ (posedge slow_clk) begin // set each bit of sample to a byte 
			samplebuf[0] = bit0; 
			samplebuf[1] = bit1;
			samplebuf[2] = bit2;
			samplebuf[3] = bit3;
			samplebuf[4] = bit4;
			samplebuf[5] = bit5;
			samplebuf[6] = bit6;
			samplebuf[7] = bit7;

    case(reset)
	 
	 0: begin
			case (count) 
				3'b000: begin out[7:0] = samplebuf; count = count + 1; end // sample 1 
				3'b001: begin out[15:8] = samplebuf; count = count + 1; end // sample 2
				3'b010: begin out[23:16] = samplebuf; count = count + 1; end // sample 3
				3'b011: begin out[31:24] = samplebuf; count = count + 1; end // sample 4
				3'b100: begin out[39:32] = samplebuf; count = count + 1; end // sample 5
				3'b101: begin out[47:40] = samplebuf; count = count + 1; end // sample 6
				3'b110: begin out[55:48] = samplebuf; count = count + 1; end // sample 7
				3'b111: begin out[63:56] = samplebuf; count = count + 1; end // sample 8
				default: count = 0;
			endcase
			end
	 1: begin 
			out[63:0] = 0; end
	 endcase
	end

endmodule 