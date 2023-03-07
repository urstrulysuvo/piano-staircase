import serial
import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

class DigitalInput:
    def __init__(self, pinNumber):
        self.pinNumber = pinNumber
        self._prevInput = 0
        GPIO.setup(pinNumber, GPIO.IN)
    
    def is_active(self):
    	input = GPIO.input(self.pinNumber)
    	if self._prevInput != input:
    		print(self.pinNumber, ": ", input)
    		self._prevInput =input
    		return input == 1
    	return False

sensor_c = DigitalInput(16)
sensor_d = DigitalInput(18)
sensor_e = DigitalInput(22)
sensor_f = DigitalInput(24)
sensor_g = DigitalInput(26)
sensor_a = DigitalInput(32)
sensor_b = DigitalInput(36)
sensor_c2 = DigitalInput(38)
sensor_d2 = DigitalInput(40)

ser = serial.Serial("/dev/serial0", 9600)

while False:
	if sensor_c.is_active():
		ser.write("c\n".encode())
		time.sleep(0.05)
	

while True:
	if sensor_c.is_active():
		ser.write("c\n".encode())
		print("c")
		time.sleep(0.05)
	if sensor_d.is_active():
		ser.write("d\n".encode())
		print("d")
		time.sleep(0.05)
	if sensor_e.is_active():
		ser.write("e\n".encode())
		print("e")
		time.sleep(0.05)
	# if sensor_f.is_active():
	# 	ser.write("f\n".encode())
	# 	#time.sleep(0.05)
	# if sensor_g.is_active():
	# 	ser.write("g\n".encode())
	# 	#time.sleep(0.05)
	# if sensor_a.is_active():
	# 	ser.write("a\n".encode())
	# 	#time.sleep(0.05)
	# if sensor_b.is_active():
	# 	ser.write("b\n".encode())
	# 	#time.sleep(0.05)
	# if sensor_c2.is_active():
	# 	ser.write("x\n".encode())
	# 	#time.sleep(0.05)
	# if sensor_d2.is_active():
	# 	ser.write("y\n".encode())
	# 	#time.sleep(0.05)
