#!/usr/bin/env python3

import sys
import json
import time

import paho.mqtt.publish as mqtt
from pymodbus.client.sync import ModbusSerialClient as ModbusClient

client = ModbusClient(method='ascii', port=sys.argv[1], timeout=30, baudrate=9600)
client.connect()

while True:
        # Unit -> slave address
        # Address -> holding register addres
        # Count -> count of registers
        data = client.read_holding_registers(unit=42, address=1000, count=6)
        temperature = int(data.getRegister(0)) + int(data.getRegister(1)) / 100.0
        pressure = int(data.getRegister(2)) + int(data.getRegister(3)) / 100.0
        humidity = int(data.getRegister(4)) + int(data.getRegister(5)) / 100.0

        print('temperature: {}, humidity: {}, pressure: {}'.format(temperature, humidity, pressure))

        telemetry = { 'temp': temperature, 'rh': humidity, 'press': pressure }

        mqtt.single(topic='v1/devices/me/telemetry',
                payload=json.dumps(telemetry),
                hostname='demo.thingsboard.io',
                auth = {'username':'fHE2yMKUw9pQZmMyHSRX', 'password':''}
        )

        time.sleep(10)
