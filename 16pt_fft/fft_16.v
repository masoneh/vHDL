////////////////
////Thea Zhu///
///////////////


//this is a stupid hard code for 16 point fft 

module fft_16 (
    input clk,
    input reset,
    input [15:0] x_real,
    input [15:0] x_imag,
    output reg [15:0] y_real,
    output reg [15:0] y_imag
);

reg [15:0] stage1_real [7:0];
reg [15:0] stage1_imag [7:0];

reg [15:0] stage2_real [3:0];
reg [15:0] stage2_imag [3:0];

reg [15:0] stage3_real [1:0];
reg [15:0] stage3_imag [1:0];

always @(posedge clk) begin
   

    if (reset) begin

    // loop each element of stage_real to assign 0
    for (integer i=0;i<8;i=i+1)begin
        stage1_real[i]<=0;
    end

        y_real <= 16'h0;
        y_imag <= 16'h0;

    end else begin
        // Stage 1
        stage1_real[0] <= x_real[0];
        stage1_imag[0] <= x_imag[0];
        stage1_real[1] <= x_real[8];
        stage1_imag[1] <= x_imag[8];
        stage1_real[2] <= x_real[4];
        stage1_imag[2] <= x_imag[4];
        stage1_real[3] <= x_real[12];
        stage1_imag[3] <= x_imag[12];
        stage1_real[4] <= x_real[2];
        stage1_imag[4] <= x_imag[2];
        stage1_real[5] <= x_real[10];
        stage1_imag[5] <= x_imag[10];
        stage1_real[6] <= x_real[6];
        stage1_imag[6] <= x_imag[6];
        stage1_real[7] <= x_real[14];
        stage1_imag[7] <= x_imag[14];
        
        // Stage 2
        stage2_real[0] <= stage1_real[0] + stage1_real[1];
        stage2_imag[0] <= stage1_imag[0] + stage1_imag[1];
        stage2_real[1] <= stage1_real[2] + stage1_real[3];
        stage2_imag[1] <= stage1_imag[2] + stage1_imag[3];
        stage2_real[2] <= stage1_real[4] + stage1_real[5];
        stage2_imag[2] <= stage1_imag[4] + stage1_imag[5];
        stage2_real[3] <= stage1_real[6] + stage1_real[7];
        stage2_imag[3] <= stage1_imag[6] + stage1_imag[7];
        stage2_real[0] <= stage1_real[0] - stage1_real[1];
        stage2_imag[0] <= stage1_imag[0] - stage1_imag[1];
        stage2_real[1] <= stage1_real[2] - stage1_real[3];
        stage2_imag[1] <= stage1_imag[2] - stage1_imag[3];
        stage2_real[2] <= stage1_real[4] - stage1_real[5];
        stage2_imag[2] <= stage1_imag[4] - stage1_imag[5];
        stage2_real[3] <= stage1_real[6] - stage1_real[7];
        stage2_imag[3] <= stage1_imag[6] - stage1_imag[7];

        // Stage 3
        stage3_real[0] <= stage2_real[0] + stage2_real[2];
        stage3_imag[0] <= stage2_imag[0] + stage2_imag[2];
        stage3_real[1] <= stage2_real[1] + stage2_real[3];
        stage3_imag[1] <= stage2_imag[1] + stage2_imag[3];
        stage3_real[0] <= stage2_real[0] - stage2_real[2];
        stage3_imag[0] <= stage2_imag[0] - stage2_imag[2];
        stage3_real[1] <= (stage2_real[1] - stage2_real[3]) * -1;
        stage3_imag[1] <= (stage2_imag[1] - stage2_imag[3]) * -1;
        
        // Stage 4
        y_real[0] <= stage3_real[0] + stage3_real[1];
        y_imag[0] <= stage3_imag[0] + stage3_imag[1];
        y_real[8] <= stage3_real[0] - stage3_real[1];
        y_imag[8] <= stage3_imag[0] - stage3_imag[1];
        y_real[4] <= stage2_real[0] + stage2_imag[2];
        y_imag[4] <= stage2_imag[0] - stage2_real[2];
        y_real[12] <= stage2_real[0] - stage2_imag[2];
        y_imag[12] <= stage2_imag[0] + stage2_real[2];
        y_real[2] <= stage3_real[1] + stage3_imag[0];
        y_imag[2] <= stage3_imag[1] - stage3_real[0];
        y_real[10] <= stage3_real[1] - stage3_imag[0];
        y_imag[10] <= stage3_imag[1] + stage3_real[0];
        y_real[6] <= stage2_real[1] + stage2_imag[3];
        y_imag[6] <= stage2_imag[1] - stage2_real[3];
        y_real[14] <= stage2_real[1] - stage2_imag[3];
        y_imag[14] <= stage2_imag[1] + stage2_real[3];
    
    end
end

endmodule
