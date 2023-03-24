module sample_to_bus(
input 50mHzclk; //FPGA 50 mHz clk 
input bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7; // 1 bit inputs 
output reg [63:0] out; // 64-bit bus comprised of 8 samples
);


reg [7:0] samplebuf; // to store 8 samples
reg [2:0] count; // count to track num of samples entered


always@(posedge 50mHzclk) begin
   samplebuf[0] <= bit0;
   samplebuf[1] <= bit1;
   samplebuf[2] <= bit2;
   samplebuf[3] <= bit3;
   samplebuf[4] <= bit4;
   samplebuf[5] <= bit5;
   samplebuf[6] <= bit6;
   samplebuf[7] <= bit7;

    case (count) 
        3'b000: begin out[7:0] <= samplebuf; count <= count + 1; end
        3'b001: begin out[15:8] <= samplebuf; count <= count + 1; end
        3'b010: begin out[23:16] <= samplebuf; count <= count + 1; end
        3'b011: begin out[31:24] <= samplebuf; count <= count + 1; end
        3'b100: begin out[39:32] <= samplebuf; count <= count + 1; end
        3'b101: begin out[47:40] <= samplebuf; count <= count + 1; end
        3'b110: begin out[55:48] <= samplebuf; count <= count + 1; end
        3'b111: begin out[63:56] <= samplebuf; count <= count + 1; end
        defaut: count <= 0;
    endcase
    
 
end
endmodule 
