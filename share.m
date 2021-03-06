clear;

data = csvread('pairs.csv');
% 2 Shaftesbury, 3 CAC, 4 GPOR, 5 Derwent -- RAW
ry2 = data(:,2); ry3 = data(:,3); ry4 = data(:,4); ry5 = data(:,5); 
% Shaftesbury, CAC, GPOR, Derwent -- INDEXED
y1 = data(:,6); y2 = data(:,7); y3 = data(:,8); y4 = data(:,9);

% Basic Plot
figure;
date = x2mdate(data(:,1));
dn = datenum(date);
plot(dn, y1); hold on; plot (dn, y2); plot(dn, y3); plot(dn, y4);
datetick('x', 'dd mm yy', 'keeplimits', 'keepticks');
xlabel('Date'); ylabel('Share price GBp');
title('Indexed Share price of London Specialists');


% Extra
m = length(y3);
ymean = (y3+y4)/2;

plot(dn, ymean);
legend('Shaftesbury', 'Capital and Counties', 'Great Portland Estates', 'Derwent' ,'GPOR and Derwent Mean');

c = (y3 - ymean).^2
% variance
%disp(c);

% Plot correlation
figure;
plot(ry3, ry4, 'x');
xlabel('CAPCO'); ylabel('GPOR');

theta = zeros(1,2);
theta = (ry3'*ry3)^-1*(ry3'*ry4);

% plot theta
figure;
plot(dn, theta*ry3); hold on;
%plot(dn, ry3);
plot(dn, ry4);
legend('CAC theta', 'CAC', 'GPOR');


    