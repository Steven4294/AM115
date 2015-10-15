%% First Extension

M1 = 150;
V1 = 30;

M2 = 40;
V2 = 100;

% constants
K = 200;

D1 = 1000;
D2 = 380;
D3 = 1000;

B1 = 500;
B2 = 500;
B3 = 500;

A1 = 100;
A2 = 100;
A3 = 100;

a = .2;
alpha = .6;

ti = 0;
tf = 100;

N = 1000;
t = linspace(0, 100, N+1); % have to add one to make it the same length as M_i's.
dt = t(2) - t(1);
for i=1:N
    M1_dot = (a*V1(i)*(1 - (V1(i)/(K - V1(i)) ))) - (D1*M1(i)*((M2(i)^2/(B1+M2(i)^2))*(M1(i)/(A1+M1(i)^3))));
   
    V1_dot =  (alpha - a)*V1(i)*(1 - (V1(i)/(K-M1(i)))) -  (V1(i)*D2*((M2(i)^2/(B2+M2(i)^2))*(M1(i)/(A2+M1(i)^2))));
    
    M2_dot = - M2(i) * (M2(i)^2/(B3 + M2(i)^3)) * (M1(i)/(A3 + M1(i)^2)) * D3;
    V2_dot = 0;
    
    M1(i+1) = M1(i) + M1_dot * dt;
    M2(i+1) = M2(i) + M2_dot * dt;
    V1(i+1) = V1(i) + V1_dot * dt;
    V2(i+1) = V2(i) + V2_dot * dt;
end

xmin = 0;
xmax = 100;
ymin = 0;
ymax = 250;
figure(1)
subplot(2,2,1)
plot(t, M1, 'o')
axis([xmin,xmax,ymin,ymax])
title('M_1')
subplot(2,2,2)
plot(t, M2, 'o')
axis([xmin,xmax,ymin,ymax])
title('M_2')
subplot(2,2,3)
plot(t, V1, 'o')
axis([xmin,xmax,ymin,ymax])
title('V_1')
subplot(2,2,4)
plot(t, V2, 'o')
axis([xmin,xmax,ymin,ymax])
title('V_2')