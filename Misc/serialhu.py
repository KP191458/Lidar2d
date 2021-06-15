import serial
ser = serial.Serial("COM3", 9600)
while True:
    print(ser.readline(10).decode('utf-8'))