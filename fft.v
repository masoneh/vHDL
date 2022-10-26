// Mason Higgins vHDL CSU 8-ptt FFT code
module fft (FDout, TDin);

input [7:0] TDin;  // Time domain sampled waveform 
output reg [7:0] FDout; // Frequency domain output

reg [7:0] bitreversed, stg1, stg1final, stg2final;  // registers for the initial bit reversed set, output of stage 1 and stage 2
reg W20 = 1; // stage 1 (2-point FFTs) W0 value

reg W40 = 1; // stage 2 (4-point FFTs) W0 value
reg W41  = -j; // stage 2 (4-point FFTs) W1 value

reg W80 = 1; // stage 3 (8-point FFTs) W0 value
reg W81 = (-1/$sqrt(2)) - j/$sqrt(2); // stage 3 (8-point FFTs) W1 value
reg W82 = -j; // stage 3 (8-point FFTs) W2 value
reg W83 = (-1/$sqrt(2)) -j/$sqrt(2); // stage 3 (8-point FFTs) W3 value

assign bitreversed [7:0] = TDin [7:0]; // for sake of testing

always @(bitreversed) begin
    
// stage 1 ~ consists of 4 2-ppt FFTs

/*for (i = 0; i < 4; i = i+1)
    begin
        stg1 [2i] = bitreversed[i] + bitreversed[i+4]*W20;
        stg1 [2i+1] = bitreversed[i] + -1*bitreversed[i+4]*W20;
    end
// set indexes straight
stg1final[0] = stg1[0];
stg1final[1] = stg1[1];
stg1final[2] = stg1[4];
stg1final[3] = stg1[5];
stg1final[4] = stg1[2];
stg1final[5] = stg1[3];
stg1final[6] = stg1[6];
stg1final[7] = stg1[7];
*/

stg1final[0] = bitreversed[0] + bitreversed[4]*W20;
stg1final[1] = bitreversed[0] + bitreversed[4]*W20*-1;
stg1final[2] = bitreversed[2] + bitreversed[6]*W20;
stg1final[3] = bitreversed[2] + bitreversed[6]*W20*-1;
stg1final[4] = bitreversed[1] + bitreversed[5]*W20;
stg1final[5] = bitreversed[1] + bitreversed[5]*W20*-1;
stg1final[6] = bitreversed[3] + bitreversed[7]*W20;
stg1final[7] = bitreversed[3] + bitreversed[7]*W20*-1; 


// stage 2 ~ consists of 2 4-ptt FFTs

stg2final [0] = stg1final[0] + stg1final[2]*W40; 
stg2final [1] = stg1final[1] + stg1final[3]*W41;
stg2final [2] = stg1final[0] + stg1final[2]*W40*-1; 
stg2final [3] = stg1final[1] + stg1final[3]*W41*-1;
stg2final [4] = stg1final[4] + stg1final[6]*W40;
stg2final [5] = stg1final[5] + stg1final[7]*W41;
stg2final [6] = stg1final[4] + stg1final[6]*W40*-1;
stg2final [7] = stg1final[5] + stg1final[7]*W41*-1;

// stage 3 ~ consists of 1 8-ptt FFT

FDout[0] = stg2final[0] + stg2final[4]*W80;
FDout[1] = stg2final[1] + stg2final[5]*W81;
FDout[2] = stg2final[2] + stg2final[6]*W82;
FDout[3] = stg2final[3] + stg2final[7]*W83;
FDout[4] = stg2final[0] + stg2final[4]*W80*-1;
FDout[5] = stg2final[1] + stg2final[5]*W81*-1;
FDout[6] = stg2final[2] + stg2final[6]*W82*-1;
FDout[7] = stg2final[3] + stg2final[7]*W83*-1;

end
endmodule