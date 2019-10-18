#!/usr/bin/env python3

import sys
import json
import time
import argparse

import paho.mqtt.publish as mqtt
from pymodbus.client.sync import ModbusSerialClient as ModbusClient

parser = argparse.ArgumentParser()
parser.add_argument("tty", help="tty to use for RS485 communication",
                    type=str)
parser.add_argument("token", help="ThingsBoard token",
                    type=str)
parser.add_argument("period", help="RS485 polling period",
                    type=str)
args = parser.parse_args()

client = ModbusClient(method='ascii', port=args.tty, timeout=30, baudrate=9600)
client.connect()

while True:
        # Unit -> slave address
        # Address -> holding register addres
        # Count -> count of registers
        data = client.read_holding_registers(unit=42, address=1000, count=6)
        temperature = int(data.getRegister(0)) + int(data.getRegister(1)) / 100.0
        pressure = int(data.getRegister(2)) + int(data.getRegister(3)) / 100.0
        humidity = int(data.getRegister(4)) + int(data.getRegister(5)) / 100.0

        print('temperature: {}, humidity: {}'.format(temperature, humidity))

        telemetry = { 'temp': temperature, 'rh': humidity }

        mqtt.single(topic='v1/devices/me/telemetry',
                payload=json.dumps(telemetry),
                hostname='demo.thingsboard.io',
                auth = {'username':args.token, 'password':''}
        )

        time.sleep(int(args.period))
