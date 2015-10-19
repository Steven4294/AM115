% solveExtension1(D1,D2,A, k, a1, alpha1, a2, alpha2, beta, M10, V10, M20, tmax)
close all
clear all
% This is when M1 > 0 and V1 and M2 are 0
[ t,P ] = solveExtension2(100,300, 8.17, 200,  1.0/6.0, 0.5, 1/6.0, .5, .3, 20, 100, 30, 40);
subplot(2,2,1);
plot(t,P);
xlabel('time');
ylabel('# individuals');
title('M1 > 0');
clear all;
% This is when M1 > 0 and V1 > 0 and M2 = 0
[ a,b ] = solveExtension2(100, 200,190, 200,  0.2, 0.5, .2, .5, .3, 25, 100, 20, 50);
subplot(2,2,2);
plot(a,b);
xlabel('time');
ylabel('# individuals');
title('V1, M1 > 0');
legend('M1','V1','M2', 'V2');
clear all;
% This is when M2 > 0 and M1 and V1 equal 0
[ t,P ] = solveExtension2(200,100,190, 200, 1.0/7.0, 0.5, .2, .5, .3, 25, 150, 50, 50);
subplot(2,2,3);
plot(t,P);
xlabel('time');
ylabel('# individuals');
title('M2 > 0');
% This is the function called by the above code
