int r0, i0, r1, i1, r2, i2, r3, i3, r4, i4, r5, i5, r6, i6, r7, i7, r8, i8, r9, i9, r10, i10, r11, i11, r12, i12, r13, i13, r14, i14, r15, i15;
int index0, index1, index2, index;
float ra, ia;
float magvals[4] = {0, 0, 0, 0};
int freqvals[4] = {0, 1875, 3750, 5625};
int count = 0;

void setup() {
  pinMode(2, INPUT); // D2
  pinMode(3, INPUT); // D3
  pinMode(4, INPUT); // D4
  pinMode(5, INPUT); // D5
  pinMode(6, INPUT); // D6
  pinMode(7, INPUT); // D7
  pinMode(8, INPUT); // D8
  pinMode(9, INPUT); // D9
  pinMode(10, INPUT); // D10
  pinMode(11, INPUT); // D11
  pinMode(12, INPUT); // D12
  pinMode(13, INPUT); // D13
  pinMode(22, INPUT); // D22
  pinMode(23, INPUT); // D23
  pinMode(24, INPUT); // D24
  pinMode(25, INPUT); // D25
  pinMode(26, INPUT); // D26
  pinMode(27, INPUT); // D27
  pinMode(28, INPUT); // D28
  pinMode(29, INPUT); // D29
  pinMode(30, INPUT); // D30
  pinMode(31, INPUT); // D31
  pinMode(32, INPUT); // D32
  pinMode(33, INPUT); // D33
  pinMode(34, INPUT); // D34
  pinMode(35, INPUT); // D35
  pinMode(36, INPUT); // D36
  pinMode(37, INPUT); // D37
  pinMode(38, INPUT); // D38
  pinMode(39, INPUT); // D39
  pinMode(40, INPUT); // D40
  pinMode(41, INPUT); // D41
  pinMode(A0, INPUT); // Index0
  pinMode(A1, INPUT); // Index1
  pinMode(A2, INPUT); // Index2
  Serial.begin(115200); // Start serial communication with MATLAB
}

void loop() {
  r0 = digitalRead(2); // bit 0 of real
  i0 = digitalRead(3); // bit 0 of imag
  r1 = digitalRead(4); // bit 1 of real
  i1 = digitalRead(5); // bit 1 of imag
  r2 = digitalRead(6); // bit 2 of real
  i2 = digitalRead(7); // bit 2 of imag
  r3 = digitalRead(8); // bit 3 of real
  i3 = digitalRead(9); // bit 3 of imag
  r4 = digitalRead(10); // bit 4 of real
  i4 = digitalRead(11); // bit 4 of imag
  r5 = digitalRead(12); // bit 5 of real
  i5 = digitalRead(13); // bit 5 of imag
  r6 = digitalRead(22); // bit 6 of real
  i6 = digitalRead(23); // bit 6 of imag
  r7 = digitalRead(24); // bit 7 of real
  i7 = digitalRead(25); // bit 7 of imag
  r8 = digitalRead(26); // bit 8 of real
  i8 = digitalRead(27); // bit 8 of imag
  r9 = digitalRead(28); // bit 9 of real
  i9 = digitalRead(29); // bit 9 of imag
  r10 = digitalRead(30); // bit 10 of real
  i10 = digitalRead(31); // bit 10 of imag
  r11 = digitalRead(32); // bit 11 of real
  i11 = digitalRead(33); // bit 11 of imag
  r12 = digitalRead(34); // bit 12 of real
  i12 = digitalRead(35); // bit 12 of imag
  r13 = digitalRead(36); // bit 13 of real
  i13 = digitalRead(37); // bit 13 of imag
  r14 = digitalRead(38); // bit 14 of real
  i14 = digitalRead(39); // bit 14 of imag
  r15 = digitalRead(40); // bit 15 of real
  i15 = digitalRead(41); // bit 15 of imag

  index0 = digitalRead(A0);
  index1 = digitalRead(A1);
  index2 = digitalRead(A2);

ra = r0*pow(2,0) + r1*pow(2,1) + r2*pow(2,2) + r3*pow(2,3) + r4*pow(2,4) + r5*pow(2,5) + r6*pow(2,6) + r7*pow(2,7) + r14*pow(2,-1) + r13*pow(2,-2) + r12*pow(2,-3) + r11*pow(2,-4) + r10*pow(2,-5) + r9*pow(2,-6) + r8*pow(2,-7);
ia = i0*pow(2,0) + i1*pow(2,1) + i2*pow(2,2) + i3*pow(2,3) + i4*pow(2,4) + i5*pow(2,5) + i6*pow(2,6) + i7*pow(2,7) + i14*pow(2,-1) + i13*pow(2,-2) + i12*pow(2,-3) + i11*pow(2,-4) + i10*pow(2,-5) + i9*pow(2,-6) + i8*pow(2,-7);
index = index0*pow(2,0) + index1*pow(2,1) + index2*pow(2,2) + 1;
count = count + 1;

Serial.print("ra");
Serial.println(ra);
Serial.print("ia");
Serial.println(ia);
Serial.print("index");
Serial.println(index);

if (count == 8) {
  delay(100000);
}



// if (index <= 4) {
//   magvals[index - 1] = sqrt(pow(ra, 2) + pow(ia, 2));
// } else {
//   magvals[8 - (index - 5)] = sqrt(pow(ra, 2) + pow(ia, 2));
// }

// // Clear the plot area
//   Serial.println("clf");
  
//   // Set the x and y limits of the plot
//   Serial.println("xlim([0, 6000])");
//   Serial.println("ylim([0, 1024])");

//   // Plot the data
//   Serial.print("plot([");
//   for (int i = 0; i < 4; i++) {
//     Serial.print(freqvals[i]);
//     if (i < 3) {
//       Serial.print(", ");
//     }
//   }
//   Serial.print("], [");
//   for (int i = 0; i < 4; i++) {
//     Serial.print(magvals[i]);
//     if (i < 3) {
//       Serial.print(", ");
//     }
//   }
//   Serial.println("])");

//   // Delay to allow time for the plot to be drawn
//   delay(1000);

 }

