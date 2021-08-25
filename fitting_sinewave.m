% % taken from matlab forum https://uk.mathworks.com/matlabcentral/answers/121579-curve-fitting-to-a-sinusoidal-function%%


data = xlsread('2 Hz');
y = data(:,1)';
x = 1:length(y);

sensor1 = data(:,1);
sensor2 = data(:,2);

yu = max(y);
yl = min(y);
yr = (yu-yl);                                                   % Range of ?y?
yz = y-yu+(yr/2);
zci = @(v) find(v(:).*circshift(v(:), 1, 1) <= 0);              % Returns Approximate Zero-Crossing Indices Of Argument Vector (>= R2016b)
zx = x(zci(yz));                                                % Find zero-crossings
per = 2*mean(diff(zx));                                         % Estimate period
ym = mean(y);                                                   % Estimate offset
fit = @(b,x)  b(1).*(sin(2*pi*x.*b(2) + 2*pi*b(3))) + b(4);     % Function to fit
fcn = @(b) sum((fit(b,x) - y).^2);                              % Least-Squares cost function
s = fminsearch(fcn, [yr;  1/per;  -1;  ym])                     % Minimise Least-Squares
xp = linspace(min(x),max(x));
figure(1)
plot(x,y,'b',  xp,fit(s,xp), 'r')
grid