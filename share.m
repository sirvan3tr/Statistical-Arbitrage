clear;

data = csvread('pairs.csv');
% Shaftesbury, CAC, GPOR, Derwent -- RAW
ry2 = data(:,2); ry3 = data(:,3); 
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
scatter(y2, y3, 'x');
xlabel('CAPCO'); ylabel('GPOR');


    