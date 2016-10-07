clear;

data = csvread('pairs.csv');
% Shaftesbury, CAC, GPOR, Derwent -- RAW
ry2 = data(:,2); ry3 = data(:,3); ry4 = data(:,4); ry5 = data(:,5); 
% Shaftesbury, CAC, GPOR, Derwent -- INDEXED
y1 = data(:,6); y2 = data(:,7); y3 = data(:,8); y4 = data(:,9);

Y = data(:,2:5);
% Basic Plot
figure;
date = x2mdate(data(:,1));
dn = datenum(date);
%hold on; plot (dn, ry3); plot(dn, ry4);
plot(dn, Y);
datetick('x', 'dd mm yy', 'keeplimits', 'keepticks');
xlabel('Date'); ylabel('Share price GBp');
title('Indexed Share price of London Specialists');

legend('Shaftesbury', 'Capital and Counties', 'Great Portland Estates', 'Derwent' ,'GPOR and Derwent Mean');

[h,pValue,stat,cValue,mles] = jcitest(Y,'model','H1');
h,pValue