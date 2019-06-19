// #include "../../common/arduino/modbus/Modbus.h"
// #include "../../common/arduino/modbus/ModbusSerial.h"

#include <SoftWire.h>

//#include "Modbus.h"
//#include "ModbusSerial.h"
#include "BME280.h"


// Single pin is used for DE/RE: allowed by the library
const auto GPIO_RS485_DE_RE         = PB0;
// Test LED
const auto GPIO_LED                 = PC13;

auto       &RS232_SERIAL            = Serial1;
HardwareSerial RS485_SERIAL(USART3);

// Modbus Test Offsets

const int TEST_IREG = 32; 
const int TEST_COIL = 33; 

//ModbusSerial mb;

SoftWire Wire1(PB7, PB6);

// BME280 bme(Wire1, 0x76);

void setup()
{
    RS232_SERIAL.begin(9600);
    RS232_SERIAL.println("BAT starting");
    delay(1000);
    pinMode(PB7, OUTPUT);
    digitalWrite(PB7, HIGH);
    delay(1000);
    digitalWrite(PB7, LOW);
    RS232_SERIAL.println("BAT end");

    Wire1.setTimeout_ms(40);
	Wire1.setDelay_us(5);
    Wire1.begin();
    delay(1000);

    //if (bme.begin() < 0) {
    //    RS232_SERIAL.println("Error communicating with sensor, check wiring");
    //    while(1){}
    //}

    pinMode(GPIO_LED, OUTPUT);
    pinMode(GPIO_RS485_DE_RE, OUTPUT);

    // Note single pin for DE/RE control
    //mb.config(&RS485_SERIAL, 9600, SERIAL_8N1, GPIO_RS485_DE_RE);
    //mb.setSlaveId(10);  

    // Add input register
    //mb.addIreg(TEST_IREG);
    // Single output coil
    //mb.addCoil(TEST_COIL);
}

void loop()
{
    RS232_SERIAL.println("Entering main loop");
    Wire1.setClock(1000);
    Wire1.startWait(0x76, SoftWire::writeMode);
    Wire1.write('v');
    Wire1.endTransmission();

    // Process modbus frames
    //mb.task();

    digitalWrite(GPIO_LED, HIGH);
    delay(500);
    digitalWrite(GPIO_LED, LOW);
    delay(500);

    //mb.Ireg(TEST_IREG, 42);
    //bool coil_status = mb.Coil(TEST_COIL);
    //RS232_SERIAL.print("Coil status: ");
    //RS232_SERIAL.println(coil_status);
}
