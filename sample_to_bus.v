module sample_to_bus(fastclk, slow_clk, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, out, set);

input fastclk; //FPGA 50 mHz clk
input bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7; // 1 bit inputs 
output reg [63:0] out; // 64-bit bus comprised of 8 samples
output reg set; // set bit to 1 to let window function know it's ready
output reg slow_clk;

reg [7:0] samplebuf; // reg to store each sample
reg [2:0] count; // count to track num of samples entered
reg [10:0] counter; // clock divider counter
integer num = 3; // change this to change slow clk freq

always @ (posedge fastclk) begin // clock divider module, setting slow clk to 10 kHz
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

    case (count) 
        3'b000: begin out[7:0] = samplebuf; count = count + 1; set = 0; end // sample 1 
        3'b001: begin out[15:8] = samplebuf; count = count + 1; end // sample 2
        3'b010: begin out[23:16] = samplebuf; count = count + 1; end // sample 3
        3'b011: begin out[31:24] = samplebuf; count = count + 1; end // sample 4
        3'b100: begin out[39:32] = samplebuf; count = count + 1; end // sample 5
        3'b101: begin out[47:40] = samplebuf; count = count + 1; end // sample 6
        3'b110: begin out[55:48] = samplebuf; count = count + 1; end // sample 7
        3'b111: begin out[63:56] = samplebuf; count = 0; set = 1; end // sample 8
    endcase
    
end
endmodule 
