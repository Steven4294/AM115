% solveExtension2(D1,D2,A, k, a1, a2, alpha, beta, M10, V10, M20, V20, tmax)
close all
clear all
% This is when M1 > 0 and V1 and M2 are 0
[ t,P ] = solveExtension2(100,300, 8.17, 200,  1.0/6.0, 1/6.0, .5, .5, 30, 30, 30, 30, 100);
subplot(2,2,1);
plot(t,P);
xlabel('time');
ylabel('# individuals');
title('M1 > 0');
clear all;
% This is when M1 > 0 and V1 > 0 and M2 = 0
[ a,b ] = solveExtension2(100,300, 8.17, 200,  1.0/6.0, 1/6.0, .5, .5, 60, 30, 30, 30, 100);
subplot(2,2,2);
plot(a,b);
xlabel('time');
ylabel('# individuals');
title('V1, M1 > 0');
legend('M1','V1','M2', 'V2');
clear all;
% This is when M2 > 0 and M1 and V1 equal 0
[ t,P ] = solveExtension2(300,100, 8.17, 200,  1.0/6.0, 1/6.0, .5, .5, 30, 60, 30, 30, 100);
subplot(2,2,3);
plot(t,P);
xlabel('time');
ylabel('# individuals');
title('M2 > 0');
% This is the function called by the above code
