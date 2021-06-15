void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600); //set bit rate of serial port connecting Arduino with computer

}

void loop() {
digitalWrite (5, HIGH);
delayMicroseconds (800);
digitalWrite (5, LOW);
delayMicroseconds (800);
Serial.println('krok');
}
