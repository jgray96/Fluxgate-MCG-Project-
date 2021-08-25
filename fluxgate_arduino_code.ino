
#include <Wire.h>
#include <Adafruit_ADS1X15.h>

Adafruit_ADS1115 ads1115;

float T=30;               //Time of measurement (s)

void setup(void)

{

  Serial.begin(2000000);

  //Serial.println("ADC Range: +/- 6.144V (1 bit = 7.8125uV)");
  ads1115.setGain(GAIN_SIXTEEN);
  ads1115.begin();
  ads1115.setDataRate(RATE_ADS1115_64SPS); //sets data rate 
  
  delay(2000); //delay 2 secs before recording begins

}

  int16_t results_x;
  int16_t results_y;
  float voltage_x;
  float B_field_x;
  float B_field_micro_teslas_x;
  float voltage_y;
  float B_field_y;
  float B_field_micro_teslas_y;
  long int start = micros();
  long int finish;
  int16_t results;


  
void loop(void)

{

  
  results_x = ads1115.readADC_Differential_0_1(); 
  results_y = ads1115.readADC_Differential_2_3();
//  voltage_y = results_y *0.0000078125; // bits to volts   
//  B_field_y = voltage_y / (4*12.2*100); //magnetic field eq
//  B_field_micro_teslas_y = B_field_y * pow(10,9); // conversion to nanoT
//  voltage_x = results_x * 0.0000078125; // bits to volts 
//  B_field_x = voltage_x / (4*12.2*100); //magnetic field eq
//  B_field_micro_teslas_x = B_field_x * pow(10,9); // conversion to nanoT
  
  
  Serial.print(results_x);
  Serial.print(" "); 
  Serial.println(results_y); 


  finish = micros();

  if ((finish - start) > (T+2)*1000000){
    while(1);
    }
    
}
