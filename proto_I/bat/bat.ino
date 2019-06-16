void setup()
{
    pinMode(PC13, OUTPUT);
}

void loop()
{
    digitalWrite(PC13, HIGH);
    delay(500);            
    digitalWrite(PC13, LOW);
    delay(500);            
}
