%% First Extension
close all
clear all

M1 = 150;
V1 = 30;

M2 = 40;
V2 = 100;

% constants
K = 200;

D1 = 100;
D2 = 380;
D3 = 200;

B1 = 800;
B2 = 530;
B3 = 20;

A1 = 150;
A2 = 240;
A3 = 300;

a = .2;
alpha = .6;

ti = 0;
tf = 100;

N = 1000;
t = linspace(0, 100, N+1); % have to add one to make it the same length as M_i's.
B1_array = linspace(100, 200, 20);
B2_array = linspace(100, 200, 20);
B3_array = linspace(100, 200, 20);
a_array = linspace(0, .5, 40);
alpha_array = linspace(.5, 1, 40);

dt = t(2) - t(1);

for j=1:length(B1_array)
    B1 = B1_array(j);
    for k = 1:length(B2_array)
        B2 = B2_array(k);
        
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
        M1_end_Bs(j, k) = M1(end);
        V1_end_Bs(j, k) = V1(end);
    end 
end

for j=1:length(a_array)
    a = a_array(j);
    for k = 1:length(alpha_array)
        alpha = alpha_array(k);
        
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
        M1_end_alpha(j, k) = M1(end);
        V1_end_alpha(j, k) = V1(end);
    end 
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

[X Y] = meshgrid(B1_array, B2_array); %for plotting purposes

figure(2)
subplot(2,2,1)
surf(X, Y, M1_end_Bs)
xlabel('B_1')
ylabel('B_2')
zlabel('M_1')
subplot(2,2,2)
surf(X, Y, V1_end_Bs)
xlabel('B_1')
ylabel('B_2')
zlabel('V_1')

[X Y] = meshgrid(alpha_array, a_array); %for plotting purposes


figure(3)
subplot(2,2,1)
surf(X, Y, M1_end_alpha)
xlabel('alpha')
ylabel('a')
zlabel('M_1')
subplot(2,2,2)
surf(X, Y, V1_end_alpha)
xlabel('alpha')
ylabel('a')
zlabel('V_1')

subplot(2,2,3)
contour(X, Y, M1_end_alpha)
title('contour for M_1')
xlabel('alpha')
ylabel('a')

subplot(2,2,4)
contour(X, Y, V1_end_alpha)
title('contour for V_1')
xlabel('alpha')
ylabel('a')
