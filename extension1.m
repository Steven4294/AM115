%% First Extension

M1 = 100;
V1 = 100;

M2 = 100;
V2 = 100;

K = 200;

D1 = 1000;
D2 = 1000;
D3 = 1000;

B1 = 100;
B2 = 100;
B3 = 100;

A1 = 50;
A2 = 50;
A3 = 50;

a = .4;
alpha = .4;

ti = 0
tf = 100;
N = 1000;

for i=1:N
    M1_dot = (a*V1(i)*(1 - (V1(i)/(K- V1(i)) ))) - (D1*M1(i)*((M2(i)^2/(B1+M2(i)^2))*(M1(i)/(A1+M1(i)^3))));
    
    V1_dot =  (alpha - a)*V1(i)*(1 - (V1(i)/(K-M1(i)))) -  (V1(i)*D2*((M2(i)^2/(B2+M2(i)^2))*(M1(i)/(A2+M1(i)^2))));
    
    M2_dot = - M2(i) * (M2(i)^2/(B3 + M2(i)^3)) * (M1(i)/(A3 + M1(i)^2)) * D3;
    V2_dot = 0;
    
    M1(i+1) = M1(i) + M1_dot;
    M2(i+1) = M2(i) + M2_dot;
    V1(i+1) = V1(i) + V1_dot;
    V2(i+1) = V2(i) + V2_dot;
end

figure(1)
subplot(2,2,1)
plot(M1)
title('M_1')
subplot(2,2,2)
plot(M2)
title('M_2')
subplot(2,2,3)
plot(V1)
title('M_2')
subplot(2,2,4)
plot(V2)
title('M_2')