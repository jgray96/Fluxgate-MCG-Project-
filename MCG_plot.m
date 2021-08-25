clc
clear all

data = xlsread('heartbeat large data set');
sensor1 = data(:,1);
sensor2 = data(:,2);


  voltage_y = sensor1 *0.0000078125;  %bits to volts   
  B_field_y = voltage_y / (4*12.2*100); %//magnetic field eq
  B_field_NANO_teslas_y = B_field_y * 10^6; %// conversion to nanoT
  
  voltage_x = sensor2 * 0.0000078125; %// bits to volts
  B_field_x = voltage_x / (4*12.2*100); %//magnetic field eq
  B_field_NANO_teslas_x = B_field_x * 10^6; %// conversion to nanoT


x = 0:30/(length(sensor1)-1):30;

plot(x,B_field_NANO_teslas_y,x,B_field_NANO_teslas_x);
title('Model Heartbeat 60 bpm')
legend('sensor 1','sensor 2')
xlabel('Time [ s ]')
ylabel('Magnetic Field Strength [ µT ]')