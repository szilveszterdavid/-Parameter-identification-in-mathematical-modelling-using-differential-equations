clear
close
clc

input = readmatrix('data.txt');

[n, m] = size(input);

x = ones(n - 1, m + 1);
y = ones(n - 1, m + 1);
z = ones(n - 1, m + 1);

x2 = ones(n - 1, m + 1);
y2 = ones(n - 1, m + 1);
z2 = ones(n - 1, m + 1);

a1 = ones(n - 1, m + 1);
a2 = ones(n - 1, m + 1);
a3 = ones(n - 1, m + 1);

a21 = ones(n - 1, m + 1);
a22 = ones(n - 1, m + 1);
a23 = ones(n - 1, m + 1);

for i = 1 : n - 1
    x(i, 1) = (input(i + 1, 1) + input(i, 1)) / 2;
    x(i, 2) = (input(i + 1, 1)^2 + input(i, 1)^2) / 2;
    x(i, 3) = (input(i + 1, 1) * input(i + 1, 2) + input(i, 1) * input(i, 2)) / 2;
    x(i, 4) = (input(i + 1, 1) * input(i + 1, 3) + input(i, 1) * input(i, 3)) / 2;
    
    y(i, 1) = (input(i + 1, 2) + input(i, 2)) / 2;
    y(i, 3) = (input(i + 1, 2)^2 + input(i, 2)^2) / 2;
    y(i, 2) = (input(i + 1, 2) * input(i + 1, 1) + input(i, 2) * input(i, 1)) / 2;
    y(i, 4) = (input(i + 1, 2) * input(i + 1, 3) + input(i, 2) * input(i, 3)) / 2;
    
    z(i, 1) = (input(i + 1, 3) + input(i, 3)) / 2;
    z(i, 4) = (input(i + 1, 3)^2 + input(i, 3)^2) / 2;
    z(i, 2) = (input(i + 1, 3) * input(i + 1, 1) + input(i, 3) * input(i, 1)) / 2;
    z(i, 3) = (input(i + 1, 3) * input(i + 1, 2) + input(i, 3) * input(i, 2)) / 2;
    
    x2(i, 1) = 1;
    x2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
    x2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
    x2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;
    
    y2(i, 1) = 1;
    y2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
    y2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
    y2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;
    
    z2(i, 1) = 1;
    z2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
    z2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
    z2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;
end

d1 = ones(n - 1, 1);
d2 = ones(n - 1, 1);
d3 = ones(n - 1, 1);

d21 = ones(n - 1, 1);
d22 = ones(n - 1, 1);
d23 = ones(n - 1, 1);

for i = 1 : n - 1
    d1(i) = input(i + 1, 1) - input(i, 1);
    d2(i) = input(i + 1, 2) - input(i, 2);
    d3(i) = input(i + 1, 3) - input(i, 3);
    
    d21(i) = log(input(i + 1, 1)) - log(input(i, 1));
    d22(i) = log(input(i + 1, 2)) - log(input(i, 2));
    d23(i) = log(input(i + 1, 3)) - log(input(i, 3));
end

a1 = (inv(transpose(x) * x)) * transpose(x) * d1
a2 = (inv(transpose(y) * y)) * transpose(y) * d2
a3 = (inv(transpose(z) * z)) * transpose(z) * d3

a21 = (inv(transpose(x2) * x2)) * transpose(x2) * d21
a22 = (inv(transpose(y2) * y2)) * transpose(y2) * d22
a23 = (inv(transpose(z2) * z2)) * transpose(z2) * d23


t = 0 : 1 : n - 1;

a = [a1 a2 a3]

[t, y] = ode45(@(t, y) Lotka_Volterra(t, y, a), t, input(1, :));

plot(t, y(:, 1), 'r-*')
hold on;

aa = [a21 a22 a23]

[t, y] = ode45(@(t, y) Lotka_Volterra(t, y, aa), t, input(1, :));

plot(t, y(:, 1), 'g-*')
hold on;

aaa = [0.45 -0.6 -0.2 -0.66;
       0.86 -0.02 -1.8 -0.59;
       0.2 -0.06 -0.13 -0.5];

[t, y] = ode45(@(t, y) Lotka_Volterra(t, y, aaa'), t, input(1, :));

plot(t, y(:, 1), 'b-*')
hold on;

title('X komponens')
legend('Integral', 'Log Integral', 'AI');
grid on;

ylim([0.25 0.6])





