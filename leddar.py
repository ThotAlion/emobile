import minimalmodbus,time
minimalmodbus.BAUDRATE = 115200
m = minimalmodbus.Instrument("/dev/ttyACM0",1,'rtu')
# garder cette pause
time.sleep(1)

dist1 = [0]*8
while True:
    t0 = time.time()
    # lire tous les registres d'un coup de 16 a 16+8
    dist1 = m.read_registers(16,8,4)
    t1 = time.time()
    print t1-t0,dist1
    time.sleep(0.01)
