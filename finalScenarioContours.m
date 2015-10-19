clear all;close all;
n = 10;
alpha_array = linspace(0, 1, n);
a2 = .5;
A_array = linspace(50, 150, n);

V10 = 50;
M10 = 50;
M20 = 50;
V20 = 50;

k = 200;
D1 = 50;
D2 = 50;
tmax = 15;
beta = .2;
a1 = .1;

% Find M1, V1, M2, V2 values for different alpha1 and alpha2
for j=1:length(alpha_array)
    alpha = alpha_array(j);
    for k = 1:length(A_array)
        A = A_array(k);
        
        % see code snippet 4 for this function
        %[ t,P ]  = solveExtension2(D1,D2, A, k, a1, a2, alpha, beta, M10, V10, M20, V20, tmax);
        [ t,P ]  = solveExtension2(D1,D2, A, k, a1, a2, alpha, beta, M10, V10, M20, V20, tmax);

        M1(j, k) = P(1,end);
        V1(j, k) = P(2,end);
        M2(j, k) = P(3,end);
        V2(j, k) = P(4,end);
    end
end
% in order to plot parameter dependencies
[X Y] = meshgrid(alpha_array, A_array);
subplot(2,4,1)
surf(X, Y, M1)
xlabel('alpha')
ylabel('A')
zlabel('M_1')
subplot(2,4,2)
surf(X, Y, V1)
xlabel('alpha')
ylabel('A')
zlabel('V_1')
subplot(2,4,3)
surf(X, Y, M2)
xlabel('alpha')
ylabel('A')
zlabel('M_2')
subplot(2,4,4)
surf(X, Y, V2)
xlabel('alpha')
ylabel('A')
zlabel('V_2')
subplot(2,4,5)
contour(X, Y, M1, 'ShowText','on')
title('contour for M_1')
xlabel('alpha')
ylabel('A')
subplot(2,4,6)
contour(X, Y, V1, 'ShowText','on')
title('contour for V_1')
xlabel('alpha')
ylabel('A')
subplot(2,4,7)
contour(X, Y, M2, 'ShowText','on')
title('contour for M_2')
xlabel('alpha')
ylabel('A')
subplot(2,4,8)
contour(X, Y, V2, 'ShowText','on')
title('contour for V_2')
xlabel('alpha_1')
ylabel('alpha_2')