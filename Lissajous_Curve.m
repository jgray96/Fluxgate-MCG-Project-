data = xlsread('2 Hz');
sensor1 = data(:,1);
sensor2 = data(:,2);

  voltage_x = sensor1 *0.0000078125;  %bits to volts   
  B_field_x = voltage_x / (4*12.2*100); %//magnetic field eq
  B_field_NANO_teslas_x = B_field_x * 10^6; %// conversion to nanoT
  voltage_y = sensor2 * 0.0000078125; %// bits to volts 
  B_field_y = voltage_y / (4*12.2*100); %//magnetic field eq
  B_field_NANO_teslas_y = B_field_y * 10^6; %// conversion to nanoT


plot(abs(B_field_NANO_teslas_x),abs(B_field_NANO_teslas_y));
title('Lissajous Curve Due To ADC Time Delay')
legend('sensor 1 vs sensor 2')
xlabel('SENSOR 1 [ µT ]')
ylabel('SENSOR 2 [ µT ]')


