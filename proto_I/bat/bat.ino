const auto GPIO_RS485_DE      = PB0;
const auto GPIO_RS485_RE      = PB1;
const auto GPIO_RS485_TX      = PB10;
const auto GPIO_RS485_RX      = PB11;
const auto GPIO_LED           = PC13;

auto       &RS232_SERIAL      = Serial1;
auto       &RS485_SERIAL      = Serial3;

void setup()
{
    RS232_SERIAL.begin(9600);
    RS485_SERIAL.begin(9600);

    RS232_SERIAL.println("BAT starting");

    pinMode(GPIO_LED, OUTPUT);
    pinMode(GPIO_RS485_DE, OUTPUT);
    pinMode(GPIO_RS485_RE, OUTPUT);

    digitalWrite(GPIO_RS485_DE, LOW);
    digitalWrite(GPIO_RS485_RE, HIGH);
}


void loop()
{
    RS232_SERIAL.println("Entering main loop");
    digitalWrite(GPIO_LED, HIGH);
    delay(500);
    digitalWrite(GPIO_LED, LOW);
    delay(500);

    // Writing RS485

    digitalWrite(GPIO_RS485_DE, HIGH);
    delay(10);
    RS485_SERIAL.println("TEST");
    RS485_SERIAL.flush();
    delay(10);
    digitalWrite(GPIO_RS485_DE, LOW);

    // Reading RS485

    RS232_SERIAL.println("Reading RS485 with 2s delay");

    digitalWrite(GPIO_RS485_RE, LOW);
    delay(2000);
    digitalWrite(GPIO_RS485_RE, HIGH);

    if (RS485_SERIAL.available() > 0) {
        RS232_SERIAL.print("Data received: ");

        while (RS485_SERIAL.available() > 0) {
            RS232_SERIAL.write(RS485_SERIAL.read());
        }

        RS232_SERIAL.println("");
    }
}
