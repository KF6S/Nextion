import os
import serial

os.system('systemctl stop pistar-watchdog.timer')
os.system('systemctl stop pistar-watchdog')
os.system('systemctl stop mmdvmhost.timer')
os.system('systemctl stop mmdvmhost')
os.system('systemctl stop nextiondriver')

e = "\xff\xff\xff"
ser = serial.Serial(port='/dev/ttyUSB0',baudrate = 9600,timeout=1)
for baudrate in (9600,115200):
     ser.baudrate = baudrate
     ser.timeout = 3000 / baudrate + .2
     ser.write("\xff\xff\xff")
     ser.write('connect')
     ser.write("\xff\xff\xff")
     r = ser.read(128)
     if 'comok' in r:
         status, unknown1, model, fwversion, mcucode, serial, flashSize = r.strip("\xff\x00").split(',')
         #print r
         sall = r
         print  model[0:10] +  "," + str(baudrate) + "," + str(fwversion) + "," + str(flashSize) 
         break

os.system('systemctl start pistar-watchdog.timer')
os.system('systemctl start pistar-watchdog')
os.system('systemctl start mmdvmhost.timer')
os.system('systemctl start mmdvmhost')
os.system('systemctl start nextiondriver')

