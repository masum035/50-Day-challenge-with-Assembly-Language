/*
 * Day-41    Date:11 June.2021
 * auther: Abdullah Al masum 2
 */
# include "LiquidCrystal.h"  //lcd libary 
                                      
LiquidCrystal lcd(2, 3, 4, 5, 6, 7);   //LCD object Parameters: (rs, enable, d4, d5, d6, d7)
const int trigPin = 12; //trig pin connection 
const int echoPin = 11;  //echopin connection 
long duration;
float distanceCm,distanceFeet;
                                                                                                            
void setup() {      // setup perameter
    lcd.begin(16,2);                                                   
    pinMode(trigPin, OUTPUT);
    pinMode(echoPin, INPUT);
    lcd.setCursor(0,0);
    lcd.print("  --Project--   ");
    lcd.setCursor(0,1);
    lcd.print("  --Durotto-- ");
    delay(2000);
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Made By    ");
    lcd.setCursor(0,1);
    lcd.print("Grouop - 23");
    delay(2000);
    lcd.clear();
}

void loop() {   // loop of flow program
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distanceCm = duration*0.034 / 2;  // This is standard calibration 
    distanceFeet = distanceCm / 30.48;  // converting to feet                                                                            
    lcd.setCursor(0,0);                                                 
    lcd.print("Object Located.");
    delay(10);
    lcd.setCursor(0,1);
    lcd.print("Distance:");
    lcd.print(distanceFeet);
    lcd.print(" Ft ");
    delay(10);
}
