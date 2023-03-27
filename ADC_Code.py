from machine import ADC, Pin
from utime import sleep
audio = ADC(27)
bit_0 = Pin(0, mode = Pin.OUT, value = 0)
bit_1 = Pin(1, mode = Pin.OUT, value = 0)
bit_2 = Pin(2, mode = Pin.OUT, value = 0)
bit_3 = Pin(3, mode = Pin.OUT, value = 0)
bit_4 = Pin(4, mode = Pin.OUT, value = 0)
bit_5 = Pin(5, mode = Pin.OUT, value = 0)
bit_6 = Pin(6, mode = Pin.OUT, value = 0)
bit_7 = Pin(7, mode = Pin.OUT, value = 0)
 

while True:
    raw = audio.read_u16()  
    print('Raw: {} '.format(raw))
         
    b0 = raw % 2					# set the specified bit as the remainder of the first division
    value = raw // 2				# divide the decimal integer by 2
    print(value)
         
    b1 = value % 2					# repeat for all 16 bits of the ADC
    value = value // 2				# NOTE: the ADC is 12 bits scaled to 16 bits, we only used the
    print(value)					# 8 most significant bits
         
    b2 = value % 2
    value = value // 2
    print(value)
         
    b3 = value % 2
    value = value // 2
    print(value)

    b4 = value % 2
    value = value // 2
    print(value)

    b5 = value % 2
    value = value // 2
    print(value)

    b6 = value % 2
    value = value // 2
    print(value)

    b7 = value % 2
    value = value // 2
    print(value)

    b8 = value % 2
    value = value // 2
    print(value)

    b9 = value % 2
    value = value // 2
    print(value)

    b10 = value % 2
    value = value // 2
    print(value)

    b11 = value % 2
    value = value // 2
    print(value)

    b12 = value % 2
    value = value // 2
    print(value)

    b13 = value % 2
    value = value // 2
    print(value)

    b14 = value % 2
    value = value // 2
    print(value)

    b15 = value % 2
    value = value // 2
    print(value)

    print(b15,b14,b13,b12,b11,b10,b9,b8)		#print binary conversion

    bit_7.value(b15)				#setting the 8 most significant bits to pins
    bit_6.value(b14)
    bit_5.value(b13)
    bit_4.value(b12)
    bit_3.value(b11)
    bit_2.value(b10)
    bit_1.value(b9)
    bit_0.value(b8)

    sleep(1)
