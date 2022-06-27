


f = @(t,w) [w(1)*(A(1,1)+A(1,2)*w(1)+A(1,3)*w(2)+A(1,4)*w(3));
            w(2)*(A(2,1)+A(2,2)*w(1)+A(2,3)*w(2)+A(2,4)*w(3));
            w(3)*(A(3,1)+A(3,2)*w(1)+A(3,3)*w(2)+A(3,4)*w(3))]; 

T=0:1:18; 
W0=[0.52 0.15 0.33]; 
[time,theta] = ode45(f,T,W0);  %a diff egynelet megoldasa

subplot(311);
plot(time,Data(:,1));
hold on
grid on
plot(time,theta(:,1));

subplot(312);
plot(time,Data(:,2));
hold on
grid on
plot(time,theta(:,2));

subplot(313);
plot(time,Data(:,3));
hold on
grid on
plot(time,theta(:,3));

mse1=(1/19)*sum(((Data(:,1)-theta(:,1)).^2))
mse2=(1/19)*sum(((Data(:,2)-theta(:,2)).^2))
mse3=(1/19)*sum(((Data(:,3)-theta(:,3)).^2))

mse=(mse1+mse2+mse3)/3;


