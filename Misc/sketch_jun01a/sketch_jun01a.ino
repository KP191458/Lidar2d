// Include the AccelStepper Library
#include <AccelStepper.h>

// Define pin connections
const int dirPin = 4;
const int stepPin = 5;

// Define motor interface type
#define motorInterfaceType 1

// Creates an instance
AccelStepper myStepper(motorInterfaceType, stepPin, dirPin);

void setup() {
  Serial.begin(9600);
  // set the maximum speed, acceleration factor,
  // initial speed and the target position
  myStepper.setMaxSpeed(1000);
  myStepper.setAcceleration(50);
  myStepper.setSpeed(100);
  myStepper.moveTo(0);
}

void loop() {

  for (int i = 0; i < 400 ; i++)
  {
      //Serial.println(myStepper.currentPosition());
      Serial.println(i);
      myStepper.moveTo(i);
      delay(100);
      myStepper.run();
  }
  for (int i = 400; i > 0 ; i--)
  {
      //Serial.println(myStepper.currentPosition());
      Serial.println(i);
      myStepper.moveTo(i);
      delay(100);
      myStepper.run();
  }
}
