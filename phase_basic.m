% Phase place plots of base case

clf; clear all

% Parameters, which can be varied to produce introducing results. 
alpha=0.5;
k=200; 
A=10;

% C_2=M_2= population of Civilization 2. Similarly, % C_1=V_1 = population
% of Civilization 1
% For this basic case, the population of Civ 2 is constant, since everyone
% is military and no one in Civ 1 is military, so Civ 2 cannot die
% Carrying capacity is 200, so we will make the phase portrait from 0 to
% 200
i=0;
for M_2=0:5:200
  i=i+1;
  j=0;
  for V_1=0:5:200
    j=j+1;
    VV1(i,j)=V_1;
    MM2(i,j)=M_2;
    dV_1(i,j)=alpha.*V_1.*(1-(V_1./k))-V_1*((M_2.^2)./(A^2+M_2.^2));
    dM_2(i,j)=0;
  end
end


% plot arrows in phase plane:
quiver(VV1,MM2,dV_1,dM_2)
h(1)=title('Civ 1 and Civ 2 populations');
h(2)=xlabel('Civilization 1');
h(3)=ylabel('Civilization 2');
h(4)=gca;
set(h,'FontSize',18)
axis([0 200 0 200])
