% solveExtension2(D1,D2,A, k, a1, a2, alpha, beta, M10, V10, M20, V20, tmax)
close all
clear all
% This is when M1 > 0 and V1 and M2 are 0
[ t,P ] = solveExtension2(100,300, 8.17, 200,  1.0/6.0, 1/6.0, .5, .5, 30, 30, 30, 30, 100);
plot(t,P);
xlabel('time');
ylabel('# individuals');
title('V1 = 0');

legend('M1','V1','M2', 'V2');
clear all;
