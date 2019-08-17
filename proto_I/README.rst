##################################
Happy Snail TH-Sensor: Prototype I
##################################

****************************
Basic Acceptance Test Pinmux
****************************

+----------+-------------------+-------------------+---------------------+
| MCU Pin  | Purpose           | External Device   | External Device Pin |
+==========+===================+===================+=====================+
| Debug UART: 9600 baud                                                |
+----------+-------------------+-------------------+---------------------+
| PA2      | UART2 TX          | USB/UART module   | RX                  |
+----------+-------------------+-------------------+---------------------+
| PA3      | UART2 RX          | USB/UART module   | TX                  |
+----------+-------------------+-------------------+---------------------+
| RS485/ModBus: 9600 baud                                                |
+----------+-------------------+-------------------+---------------------+
|          |                   |                   | DE                  |
| PA5      | RS485: DE/~RE pin | TTL/RS485 module  +---------------------+
|          |                   |                   | ~RE                 |
+----------+-------------------+-------------------+---------------------+
| PA9      | UART1 TX          | TTL/RS485 module  | DI                  |
+----------+-------------------+-------------------+---------------------+
| PA10     | UART1 RX          | TTL/RS485 module  | RO                  |
+----------+-------------------+-------------------+---------------------+
| I2C for RH/T sensor                                                    |
+----------+-------------------+-------------------+---------------------+
| PB6      | I2C1 SCL          | Sensor module     | SCL                 |
+----------+-------------------+-------------------+---------------------+
| PB7      | I2C1 SDA          | Sensor module     | SDA                 |
+----------+-------------------+-------------------+---------------------+

*******************************
Basic Acceptance Test Procedure
*******************************

#. Install ``west`` and `Zephyr v1.14.0`_

#. Build an image::

     export ZEPHYR_BASE=/path/to/zephyr/repo
     export GNUARMEMB_TOOLCHAIN_PATH=/path/to/arm-none-eabi/toolchain
     export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
     make bat

#. Connect to the board::

      openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg

   Do not forget to hold RESET button, otherwise board will remain in sleep mode and not respond
   to debug requests

#. Run GDB and flash the BAT image::

      arm-none-eabi-gdb -ex "target extended-remote :3333" ./bat_zephyr/build/zephyr/zephyr.elf
      ...
      (gdb) monitor reset halt
      ...
      (gdb) load
      ....
      (gdb) c

#. Connect to RS485 port with ``pymodbus.console``::

      ~/.local/bin/pymodbus.console serial --method ascii --baudrate 9600 --stopbits 1 --parity N --port /dev/ttyUSB0 --timeout 100.0

#. Read test registers::

      > client.read_holding_registers unit=42 address=1000 count=6

#. Observe logs

   In ``pymodbus.console``::

      {
        "registers": [
            26,
            30,
            100,
            21,
            37,
            0
        ]
      }

   Device::

      ***** Booting Zephyr OS zephyr-v1.14.0 *****
      Hello World! stm32_min_dev
      bme280_dev 0x2000137c name BME280

      > data 1: :A0303E80006E2

      buf state: 0 3
      frame start detected
      > modbus processed: 1
      > data 16: 2A0303E80006E2

      buf state: 0 1
      CR detected
      LF detected
      data recv: 2A0303E80006E2
      > modbus processed: 15
      temp: 26.300000; press: 100.211429; humidity: 37.004882
      > sending: :2A030C001A001E0064001500250000F1

      response sent

.. _`Zephyr v1.14.0`: https://docs.zephyrproject.org/latest/getting_started/index.html
