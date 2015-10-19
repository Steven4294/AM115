function [ t,P ] = solveExtension2(D1,D2,A, k, a1, a2, alpha, beta, M10, V10, M20, V20, tmax)


sol=ode45(@TwoCivmodel,[0 200],[M10,V10,M20,V20]);
t=linspace(0,tmax);
P=deval(sol,t);
    function dP=TwoCivmodel(t,P)
        dP=zeros(4,1);
%         dP(1)=     a1 *alpha*P(2)*(1 - P(2)/((1-a1)*k)) -   (D1*P(1)*(P(3)^2 / (A^2 + P(3)^2)))*(1 / (A + P(1)^2));
%         dP(2)=(1 - a1)*alpha*P(2)*(1 - P(2)/((1-a1)*k)) - (6*D1*P(2)*(P(3)^2 / (A^2 + P(3)^2)))*(1 / (A + P(1)));
%         dP(3)=     a2 *beta *P(4)*(1 - P(2)/((1-a2)*k)) -   (D2*P(3)*(P(1)^2 / (A^2 + P(1)^2)))*(1 / (A + P(3)^2));
%         dP(4)=(1 - a2)*beta *P(4)*(1 - P(2)/((1-a2)*k)) - (6*D2*P(4)*(P(1)^2 / (A^2 + P(1)^2)))*(1 / (A + P(3)));
        
        dP(1)=     a1 *alpha*P(2)*(1 - (P(2)/((k)))) -   (D1*P(1)*(P(3)^2 / (A^2 + P(3)^2)))*(1 / (A + P(1)^2));
        dP(2)=(1 - a1)*alpha*P(2)*(1 - (P(2)/((k)))) - (6*D1*P(2)*(P(3)^2 / (A^2 + P(3)^2)))*(1 / (A + P(1)));
        dP(3)=     a2 *beta *P(4)*(1 - (P(2)/((k)))) -   (D2*P(3)*(P(1)^2 / (A^2 + P(1)^2)))*(1 / (A + P(3)^2));
        dP(4)=(1 - a2)*beta *P(4)*(1 - (P(2)/((k)))) - (6*D2*P(4)*(P(1)^2 / (A^2 + P(1)^2)))*(1 / (A + P(3)));
    end
end
% example usage on Command Line
% [ t,P ] = solveExtension1(1000,1000,1000,50,50, 50, 100, 100, 100, 200, 0.2, 0.5 );