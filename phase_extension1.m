% Phase place plots of base case

clf; clear all

% Parameters, which can be varied to produce introducing results. 
alpha=0.5;
a=0.3;
k=200;
A_1=10;
A_2=10;
A_3=10;
B_1=200;
B_2=200;
B_3=200;
D_1=20;
D_2=30;
D_3=50;

% Since V_2 is 0, C_2=M_2. On the other hand, C_1=V_1+M_1.
% The change in C_1 is thus the sum of the change in V_1 and M_1
% We assume here that in our initial values, the proportion of M_1 out of
% total C_1 is (a/alpha), the same proportion of new births that will be
% dedicated to becoming soldiers. Similarly, the proportion of V_1 would be
% 1-(a/alpha). This is to avoid making a 3-D or 4-D phase diagram with V_1,
% V_2, M_1, and M_2. 
i=0;
for M_2=0:5:200
  i=i+1;
  j=0;
  for C_1=0:5:200
    j=j+1;
    CC1(i,j)=C_1;
    MM2(i,j)=M_2;
    M_1=(a/alpha)*C_1; 
    V_1=(1-(a/alpha))*C_1;
    dV_1(i,j)=(alpha-a).*V_1.*(1-(V_1./(k-M_1)))-V_1*D_2*(M_2.^2./(B_2+M_2^2))*(M_1/(A_2^2+M_1.^2));
    dM_1(i,j)=a.*V_1.*(1-(V_1./(k-V_1)))-M_1.*D_1.*(M_2^2./(B_1+M_2.^2))*(M_1./(A_1+M_1.^3));
    dC_1=dV_1+dM_1;
    dM_2(i,j)=-D_3.*M_2.*(M_2.^2./(B_3+M_2.^3)).*(M_1./(A_3+M_1.^2));
  end
end


% plot arrows in phase plane:
quiver(CC1,MM2,dC_1,dM_2)
h(1)=title('Civ 1 and Civ 2 populations');
h(2)=xlabel('Civilization 1');
h(3)=ylabel('Civilization 2');
h(4)=gca;
set(h,'FontSize',18)
axis([0 200 0 200])
