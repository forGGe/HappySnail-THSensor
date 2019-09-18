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

#. Install `pymodbus`,  a library for interfacing with ModBus::

     pip3 install pymodbus --user

#. Build an image::

     export ZEPHYR_BASE=/path/to/zephyr/repo
     export GNUARMEMB_TOOLCHAIN_PATH=/path/to/arm-none-eabi/toolchain
     export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
     make bat

#. If that's a first time the board is used, flash must be unlocked. To do that, execute::

     openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c "init; reset halt; stm32f1x unlock 0; stm32f1x mass_erase 0; reset halt; exit;"

#. Flash a board:

   #. Hold RESET button (otherwise board will remain in sleep mode and not respond to debug requests).
   #. Execute::

         make bat_flash

   #. Release RESET button when ``Now you may release RESET button`` message will appear.
   #. Check logs for successful flashing::

         st-info --probe
         Found 1 stlink programmers
          serial: 563f6c06507855505834013f
         openocd: "\x56\x3f\x6c\x06\x50\x78\x55\x50\x58\x34\x01\x3f"
           flash: 0 (pagesize: 1024)
            sram: 20480
          chipid: 0x0410
           descr: F1 Medium-density device
         echo "Now you may release RESET button"
         Now you may release RESET button
         sleep 1
         st-flash write /home/user/projects/HappySnail/HappySnail-THSensor/proto_I//bat_zephyr/build/zephyr/zephyr.bin 0x8000000
         st-flash 1.5.1
         2019-09-19T00:07:42 INFO common.c: Loading device parameters....
         2019-09-19T00:07:42 INFO common.c: Device connected is: F1 Medium-density device, id 0x20036410
         2019-09-19T00:07:42 INFO common.c: SRAM size: 0x5000 bytes (20 KiB), Flash: 0x20000 bytes (128 KiB) in pages of 1024 bytes
         2019-09-19T00:07:42 INFO common.c: Attempting to write 20000 (0x4e20) bytes to stm32 address: 134217728 (0x8000000)
         Flash page at addr: 0x08004c00 erased
         2019-09-19T00:07:43 INFO common.c: Finished erasing 20 pages of 1024 (0x400) bytes
         2019-09-19T00:07:43 INFO common.c: Starting Flash write for VL/F0/F3/F1_XL core id
         2019-09-19T00:07:43 INFO flash_loader.c: Successfully loaded flash loader in sram
          20/20 pages written
         2019-09-19T00:07:44 INFO common.c: Starting verification of write complete
         2019-09-19T00:07:44 INFO common.c: Flash written and verified! jolly good!

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

***********************************************************
Basic Acceptance Test Procedure: Upload Data to ThingsBoard
***********************************************************

In addition to previous procedure, data can be displayed using ThingsBoard platform.
To do so, proceed with following:

#. Create account on `ThingsBoard Demo Server`_

#. Create a sample ThingsBoard device, obtain its access token.

#. With hardware setup as in previous section, run the data upload script::

     # From the root of this repository
     python ./scripts/publish_bat_data.py /dev/$RS485_TTY_PORT $ACCESS_TOKEN

#. Check ThingsBoard for data.

.. _`Zephyr v1.14.0`: https://docs.zephyrproject.org/latest/getting_started/index.html
.. _`ThingsBoard Demo Server`: http://demo.thingsboard.io/
