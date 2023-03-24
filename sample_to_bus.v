module sample_to_bus(
input 50mHzclk; //FPGA 50 mHz clk 
input wire [7:0] sample; // 8-bit sample input from ADC (pico)
output reg [63:0] out; // 64-bit bus comprised of 8 samples
);


reg [7:0] samplebuf [0:7]; // to store 8 samples
reg [2:0] count; // count to track num of samples entered


always@(posedge 50mHzclk) begin
    samplebuf[count] <= sample; // store sample into bus
    count <= count + 1; // increase counter 

    if (count == 7) begin // when count = 7, all 8 samples have been receieved 
        out <= {samplebuf[7], samplebuf[6], samplebuf[5], samplebuf[4], samplebuf[3], samplebuf[2], samplebuf[1], samplebuf[0]}; // set each 8 bit sample to allocated 8 bit spot on output bus
        count <= 0; // reset counter
    end
end
endmodule 