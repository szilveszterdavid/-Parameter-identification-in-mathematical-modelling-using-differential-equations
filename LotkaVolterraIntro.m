close all; clear all; clc

a = 0.5;
b = 0.02;
c = 0.2; 
d = 2;

params = [a; b; c; d];

y0 = [5; 5]; % kezdeti ertek
time = [0 50]; %ido

[t, y] = ode45(@(t, y)LotkaVolterra(t, y, params), time, y0);

figure;
plot(t, y(:, 1), 'b-');
hold on;

plot(t, y(:, 2), 'r--');
grid on;
xlabel('Idő');
ylabel('Populáció');
title('Lotka-Volterra egyenletek');
legend('Ragadozó', 'Zsákmány');

saveas(gcf, 'Lotka_Volterra.png');

figure;

plot(y(:,1), y(:,2));
grid on;

title('Fázistér');
xlabel('Ragadozó populáció');
ylabel('Zsákmány populáció');

saveas(gcf, 'Phase_Plane_Plot.png');
