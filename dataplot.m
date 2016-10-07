clear;
t = 75;

[n,s,r] = xlsread('CAPCO Weekly data.csv');
[n1,s1,r1] = xlsread('Derwent Weekly data.csv');
[n2,s2,r2] = xlsread('Shaftesbury Weekly data.csv');
[n3,s3,r3] = xlsread('GPOR Weekly data.csv');

m = length(s);
m1 = length(s1);
m2 = length(s2);
m3 = length(s3);

dn = datenum(s(2:t+1,1), 'dd/mm/yyyy');
dn1 = datenum(s1(2:t+1,1), 'dd/mm/yyyy');
dn2 = datenum(s2(2:t+1,1), 'dd/mm/yyyy');
dn3 = datenum(s3(2:t+1,1), 'dd/mm/yyyy');

y = n(1:t,6);
y1 = n1(1:t,6);
y2 = n2(1:t,6);
y3 = n3(1:t,6);

figure;
plot(dn, y); hold on;
plot(dn1, y1);
plot(dn2, y2);
plot(dn3, y3);
datetick('x', 'dd/mm/yy', 'keeplimits', 'keepticks');
xlabel('Date'); ylabel('Share price');
legend('CAPCO', 'DLN', 'SHB', 'GPOR');


% --------------
% Plot correlation
Y = y;
d = y1;

theta = zeros(1,2);
theta = (Y'*Y)^-1*(Y'*d);

figure;
plot(Y, d, 'x'); hold on;
plot(Y, theta*Y);
xlabel('SHB'); ylabel('GPOR');



% plot theta
figure;
plot(dn, theta*Y); hold on;
plot(dn1, d);
legend('DLN theta', 'GPOR');
datetick('x', 'dd/mm/yy', 'keeplimits', 'keepticks');

% difference
figure;
diff = theta*Y - d;
bar(dn, diff);
mean(diff)
