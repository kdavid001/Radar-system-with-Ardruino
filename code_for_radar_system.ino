#include <Servo.h>

// Pin assignments
const int trigPin = 2;
const int echoPin = 9;
const int buzzpin = 7;
const int ledRed = 3;
const int ledGreen = 4;
const int switchpin = 10;
const int ledStatus = 8;

// Variables
long duration;
int distance;
bool buzzState = LOW;
unsigned long previousMillis = 0;

const long intervalFar = 250;  // Interval for objects 20–40 cm
const long intervalClose = 50;  // Interval for objects <= 20 cm

Servo myServo;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(buzzpin, OUTPUT);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
  pinMode(switchpin, INPUT);
  pinMode(ledStatus, OUTPUT);

  Serial.begin(9600);
  myServo.attach(12);
}

void loop() {
  // Check if the radar switch is on or off
  if (digitalRead(switchpin) == HIGH) {
    digitalWrite(ledStatus, LOW);  // Turn off status LED
    StartScan();
  } else {
    digitalWrite(ledStatus, HIGH);  // Turn on status LED
    resetAlert();
  }
}

// Function to calculate the distance to a detected object
int calculateDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH, 30000);  // Timeout after 30 ms
  if (duration == 0) {
    return -1;  // No echo detected
  }
  return duration * 0.034 / 2;  // Calculate distance in cm
}

// Start scanning for objects
void StartScan() {
  for (int i = 15; i <= 165; i++) {
    scanAndReact(i);
  }
  for (int i = 165; i >= 15; i--) {
    scanAndReact(i);
  }
}

// Function to perform scanning and react to detected objects
void scanAndReact(int angle) {
  myServo.write(angle);
  delay(30);

  distance = calculateDistance();
  if (distance > 0 && distance <= 20) {
    toggleAlert(millis(), intervalClose);
  } else if (distance > 20 && distance <= 40) {
    toggleAlert(millis(), intervalFar);
  } else {
    resetAlert();
  }

  Serial.print(angle);
  Serial.print(",");
  Serial.print(distance);
  Serial.println(".");
}

// Toggle buzzer and LED alerts based on proximity
void toggleAlert(unsigned long currentMillis, long interval) {
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    buzzState = !buzzState;
    digitalWrite(buzzpin, buzzState);
    digitalWrite(ledRed, buzzState);
    digitalWrite(ledGreen, HIGH);
  }
}

// Reset alerts when no object is detected
void resetAlert() {
  buzzState = LOW;
  digitalWrite(buzzpin, LOW);
  digitalWrite(ledRed, LOW);
  digitalWrite(ledGreen, LOW);
}