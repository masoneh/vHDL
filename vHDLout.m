clear
clc

a = arduino("COM5", 'Mega2560');

magvals = zeros(1, 4);
freqvals = [0,1875,3750,5625];

while true
r0 = readDigitalPin(a, 'D2'); % bit 0 of real
i0 = readDigitalPin(a, 'D3'); % bit 0 of imag
r1 = readDigitalPin(a, 'D4'); % bit 1 of real
i1 = readDigitalPin(a, 'D5'); % bit 1 of imag
r2 = readDigitalPin(a, 'D6'); % bit 2 of real
i2 = readDigitalPin(a, 'D7'); % bit 2 of imag
r3 = readDigitalPin(a, 'D8'); % bit 3 of real
i3 = readDigitalPin(a, 'D9'); % bit 3 of imag
r4 = readDigitalPin(a, 'D10'); % bit 4 of real
i4 = readDigitalPin(a, 'D11'); % bit 4 of imag
r5 = readDigitalPin(a, 'D12'); % bit 5 of real
i5 = readDigitalPin(a, 'D13'); % bit 5 of imag
r6 = readDigitalPin(a, 'D22'); % bit 6 of real
i6 = readDigitalPin(a, 'D23'); % bit 6 of imag
r7 = readDigitalPin(a, 'D24'); % bit 7 of real
i7 = readDigitalPin(a, 'D25'); % bit 7 of imag
r8 = readDigitalPin(a, 'D26'); % bit 8 of real
i8 = readDigitalPin(a, 'D27'); % bit 8 of imag
r9 = readDigitalPin(a, 'D28'); % bit 9 of real
i9 = readDigitalPin(a, 'D29'); % bit 9 of imag
r10 = readDigitalPin(a, 'D30'); % bit 10 of real
i10 = readDigitalPin(a, 'D31'); % bit 10 of imag
r11 = readDigitalPin(a, 'D32'); % bit 11 of real
i11 = readDigitalPin(a, 'D33'); % bit 11 of imag
r12 = readDigitalPin(a, 'D34'); % bit 12 of real
i12 = readDigitalPin(a, 'D35'); % bit 12 of imag
r13 = readDigitalPin(a, 'D36'); % bit 13 of real
i13 = readDigitalPin(a, 'D37'); % bit 13 of imag
r14 = readDigitalPin(a, 'D38'); % bit 14 of real
i14 = readDigitalPin(a, 'D39'); % bit 14 of imag
r15 = readDigitalPin(a, 'D40'); % bit 15 (sign bit)
i15 = readDigitalPin(a, 'D41'); % bit 15 (sign bit)

index0 = readDigitalPin(a, 'A0'); % Index0
index1 = readDigitalPin(a, 'A1'); % Index1
index2 = readDigitalPin(a, 'A2'); % Index2

ra = r0*(2^0) + r1*(2^1) + r2*(2^2) + r3*(2^3) + r4*(2^4) + r5*(2^5) + r6*(2^6) + r7*(2^7);
ia = i0*(2^0) + i1*(2^1) + i2*(2^2) + i3*(2^3) + i4*(2^4) + i5*(2^5) + i6*(2^6) + i7*(2^7);
index = index0*(2^0) + index1*(2^1) + index2*(2^2) + 1;

if (index<= 3)
    magvals(index) = sqrt(ra^2 + ia^2); % Magnitude of 1 sample
else 
    magvals(8-index) = sqrt(ra^2 + ia^2);
end

end


