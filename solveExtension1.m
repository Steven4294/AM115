function [ t,P ] = solveExtension1(D1,D2,D3,A1,A2, A3, B1, B2, B3, k, a, alpha )

sol=ode45(@TwoCivmodel,[0 30],[100,100,100,100]);

t=linspace(0,30);
P=deval(sol,t);

plot(t,P)
xlabel('time')
ylabel('numbers of individuals')
title('2 Civilzations - Extension 1')
legend('M1','V1','M2', 'V2')

    function dP=TwoCivmodel(t,P)
        dP=zeros(4,1);     
        dP(1)=a*P(2)*(1 - P(2)/(k - P(2))) - D1*P(1)*(P(3)^2 / (B1 + P(3)^2))*(P(1) / (A1 + P(1)^3));
        dP(2)=(alpha - a)*P(2)*(1 - P(2)/(k - P(1))) - D2*P(2)*(P(3)^2 / (B2 + P(3)^2))*(P(1) / (A2 + P(1)^2));
        dP(3)= -D3*P(3)*(P(3)^2 / (B3 + P(3)^3))*(P(1) / (A3 + P(1)^2));
        dP(4)=0;
    end
end

% example usage on Command Line
% [ t,P ] = solveExtension1(1000,1000,1000,50,50, 50, 100, 100, 100, 200, 0.2, 0.5 );