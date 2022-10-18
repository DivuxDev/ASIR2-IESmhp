#hecho por david Prado
#esta es la #version1
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include <stdio.h>
#include <stdlib.h>

//variables
//
//
const byte lightPin = 2;
const byte speakerPin = 9;
int lightSensor = 0;
int led = 13;
unsigned long lapMillis = 0;
unsigned long startMillis = millis();
unsigned long bestMillis = 9999999;
float lapTime = 0.00;
int lap = 0;
float bestLap = 0.00;
float Totaltime = 0.0;
boolean firstTrigger = true;
boolean newBest = false;
const char button_pin1 = 8;
const char button_pin2 = 7;
bool pressed = false;
unsigned int vueltas = 1;

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

void setup()
{
  lcd.begin(20, 4);
  lcd.setCursor(0, 0);
  lcd.print("Introducir vueltas");
  lcd.setCursor(0, 1);
  lcd.print("y Pasar por salida!");
  Serial.begin(9600);
  pinMode(speakerPin, OUTPUT);
  digitalWrite(speakerPin, LOW);
  pinMode(led, OUTPUT);
  pinMode(button_pin1, INPUT_PULLUP);
  pinMode(button_pin2, INPUT_PULLUP);
}

void loop()
{
  
  lightSensor = digitalRead(lightPin);
 //BOTONES PARA CAMBIAR VARIABLE 
bool currentState1 = digitalRead(button_pin1);
bool currentState2 = digitalRead(button_pin2);
  
  
 if (currentState1 == pressed) {
    
    vueltas = vueltas + 1;
    
    Serial.println(vueltas);
    
    while( digitalRead(button_pin1) == pressed ){}
  }
  
  if (currentState2 == pressed) {
    
    vueltas = vueltas - 1;
    
    Serial.println(vueltas);
    
    while( digitalRead(button_pin2) == pressed ){}
  }
        lcd.setCursor(0, 3);  
        lcd.print("VUELTAS: ");
        lcd.print(vueltas);
        
//
//BOTONES PARA CAMBIAR VARIABLE 
//


 


  //If car detected
  if (lightSensor < digitalRead(2))
  {


    //determine lap time in milliseconds
    lapMillis = millis() - startMillis;
    startMillis = millis();

    lapTime = lapMillis / 1000.00;

    //if firs trigger print race started
    if (firstTrigger == true)
    {
      lcd.setCursor(0, 0);
      lcd.print("A correr!!!        ");
      digitalWrite(led, HIGH);
    }

    //print if not first trigger
  if (firstTrigger != true)

    {
      //----------------------------serial vuelta ------------------------
       lap++;
       if ( lap <= vueltas )
       {
       Serial.print("fin de carrera  ");
       system("PAUSE");
      Serial.print("tiempo de vuelta  ");
      Serial.print(lap);
      Serial.print(" : ");
      Serial.println(lapTime);
      
      Totaltime += lapTime;
              
      Serial.println("Tiempo Total : "+ String(Totaltime));
      
      //Serial.print("lapMillis: ");
     // Serial.println(lapMillis);
      
//----------------------------lcd vuelta y total -------------------      
      //print lap time
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("LAP ");
      lcd.print(lap);
      lcd.print(": ");
      lcd.print(lapTime);
      
      lcd.setCursor(0, 2);
      lcd.print("TOTAL: "+ String(Totaltime));
      
                        }
      
      
      
//----------------------------serial total -------------------
      
    }


    //if last lap is better than best lap
    if (lapMillis < bestMillis && firstTrigger != true)
    {
      bestMillis = lapMillis;
      bestLap = lapTime;
//----------------------------serial mejor vuelta -------------------           
      Serial.print("mejor vuelta: ");
      Serial.println(bestLap);
//----------------------------lcd mejor vuelta -------------------      
      //print best lap time
      
      lcd.setCursor(0, 1);
      lcd.print("BEST: ");
      lcd.print(bestLap);
      
      newBest = true;
  
    }

    
    
    //beep piezo
    if (newBest == true)
    {
      digitalWrite(speakerPin, HIGH);
      delay(25);
      digitalWrite(speakerPin, LOW);
      delay(25);
      digitalWrite(speakerPin, HIGH);
      delay(25);
      digitalWrite(speakerPin, LOW);
      delay(25);
      digitalWrite(speakerPin, HIGH);
      delay(25);
      digitalWrite(speakerPin, LOW);
      delay(25);
      digitalWrite(speakerPin, HIGH);
      delay(25);
      digitalWrite(speakerPin, LOW);
      newBest = false;
    }
    else
    {
      digitalWrite(speakerPin, LOW);
      delay(150);
      digitalWrite(speakerPin, LOW);
    }

    firstTrigger = false;
    Serial.println("---------");

  }
  
}
