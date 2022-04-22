/*
  This sample sketch demonstrates the normal use of a TinyGPS++ (TinyGPSPlus) object.
  Base on TinyGPSPlus //https://github.com/mikalhart/TinyGPSPlus
*/

#include <TinyGPS++.h>
#include "utilities.h"
#include <WiFi.h>
#include <HTTPClient.h>

unsigned long dataMillis = 0;
const char* ssid = "MW41NF_3E0D";
const char* password = "08298760";

//Your Domain name with URL path or IP address with path
const char* serverName = "https://us-central1-mytravelguide-4f370.cloudfunctions.net/getLocation";

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTime = 0;
//Timer set to 5 minutes (300000)
unsigned long timerDelay = 600000;
// Set timer to 30 seconds (30000)
//unsigned long timerDelay = 30000;

float latitude;
float longitude;
float boatSpeed;
float boatCourse;
String boatName = "MV GemStar 2";
TinyGPSPlus gps;


void setup()
{
    WiFi.begin(ssid, password);
    Serial.println("Connecting");
    while(WiFi.status() != WL_CONNECTED) {
      delay(500);
      Serial.print(".");
    }
    Serial.println("");
    Serial.print("Connected to WiFi network with IP Address: ");
    Serial.println(WiFi.localIP());
    initBoard();
    // When the power is turned on, a delay is required.
    delay(1500);
    Serial.print(F("Testing TinyGPS++ library v. "));
    Serial.println(TinyGPSPlus::libraryVersion());
    Serial.println();
}

void loop()
{
  
  while (Serial1.available() > 0){
    if (gps.encode(Serial1.read())){
      displayInfo();
      if (gps.location.isValid()&& gps.speed.isValid() && gps.course.isValid()) {
        //Send an HTTP POST request every 5 minutes
        if ((millis() - lastTime) > timerDelay) {
            HTTPClient http;
            latitude = gps.location.lat();
            longitude = gps.location.lng();
            boatSpeed = gps.speed.knots();
            boatCourse = gps.course.deg();
            
            // Your Domain name with URL path or IP address with path
            http.begin(serverName);
            
            // If you need an HTTP request with a content type: application/json, use the following:
            http.addHeader("Content-Type", "application/json");

            String dat = "{\"name\":\""+ boatName +"\",\"latitude\":"+ latitude +",\"longitude\":"+ longitude +",\"speed\":"+ boatSpeed +",\"course\":"+ boatCourse +"}";
            int httpResponseCode = http.POST(dat);
           // int httpResponseCode = http.POST("{\"name\":\"MV GemStar 2\",\"latitude\":50.11,\"longitude\":44.55,\"speed\":144,\"course\":123}");
           
            Serial.print("HTTP Response code: ");
            Serial.println(httpResponseCode);
              
            // Free resources
            http.end();
         
          lastTime = millis();
        }   
      }
    }
  }
  if (millis() > 5000 && gps.charsProcessed() < 10) {
    Serial.println(F("No GPS detected: check wiring."));
    while (true);
  }
}

void displayInfo()
{
    Serial.print(F("Satellites: "));
    if (gps.satellites.isValid()) {
        Serial.print(gps.satellites.value());
    } else {
        Serial.print(F("INVALID"));
    }
    
    Serial.print(F(" "));
    Serial.print(F("Location: "));
    if (gps.location.isValid()) {
        Serial.print(gps.location.lat(), 6);
        Serial.print(F(","));
        Serial.print(gps.location.lng(), 6);
    } else {
        Serial.print(F("INVALID"));
    }

    Serial.print(F("  Date/Time: "));
    if (gps.date.isValid()) {
        Serial.print(gps.date.month());
        Serial.print(F("/"));
        Serial.print(gps.date.day());
        Serial.print(F("/"));
        Serial.print(gps.date.year());
    } else {
        Serial.print(F("INVALID"));
    }

    Serial.print(F(" "));
    if (gps.time.isValid()) {
        if (gps.time.hour() < 10) Serial.print(F("0"));
        Serial.print(gps.time.hour());
        Serial.print(F(":"));
        if (gps.time.minute() < 10) Serial.print(F("0"));
        Serial.print(gps.time.minute());
        Serial.print(F(":"));
        if (gps.time.second() < 10) Serial.print(F("0"));
        Serial.print(gps.time.second());
        Serial.print(F("."));
        if (gps.time.centisecond() < 10) Serial.print(F("0"));
        Serial.print(gps.time.centisecond());
    } else {
        Serial.print(F("INVALID"));
    }

    Serial.println();
}
