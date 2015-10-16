function [ t,P ] = solveExtension2(D1,D2,D3,D4, A1,A2, A3,A4, B1, B2, B3,B4, k, a1, a2, alpha, beta )

sol=ode45(@TwoCivmodel,[0 100],[100,100,100,100]);

t=linspace(0,100);
P=deval(sol,t);
disp(P);
plot(t,P)
xlabel('time')
ylabel('numbers of individuals')
title('2 Civilzations - Extension 1')
legend('M1','V1','M2', 'V2')

    function dP=TwoCivmodel(t,P)
        dP=zeros(4,1);     
        dP(1)=a1*P(2)*(1 - P(2)/(k - P(2))) - D1*P(1)*(P(3)^2 / (B1 + P(3)^2))*(P(1) / (A1 + P(1)^3));
        dP(2)=(alpha - a1)*P(2)*(1 - P(2)/(k - P(1))) - D2*P(2)*(P(3)^2 / (B2 + P(3)^2))*(P(1) / (A2 + P(1)^2));
        dP(3)=a2*P(4)*(1 - P(4)/(k - P(4))) -D3*P(3)*(P(1)^2 / (B3 + P(1)^2))*(P(3) / (A3 + P(3)^3));
        dP(4)=(beta - a2)*P(4)*(1 - P(4)/(k - P(3))) - D4*P(4)*(P(1)^2 / (B4 + P(1)^2))*(P(3) / (A4 + P(3)^2));
    end
end

% example usage on Command Line
% [ t,P ] = solveExtension1(1000,1000,1000,50,50, 50, 100, 100, 100, 200, 0.2, 0.5 );