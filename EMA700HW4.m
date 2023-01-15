clear
clc
close all

theta = 0:0.01:2*pi;

%Iron(Fe)
S11=7.56;
S12=-2.78;
S44=8.59;
Etheta = (0.5*(S11+S12)+0.5*(S11-S12)*(cos(2*theta)).^2+0.25*S44*(sin(2*theta)).^2).^-1;
figure(1)
polar(theta,Etheta)
xlabel({'E_{\theta}(TPa)'},'FontSize',20);
ylabel({'\theta'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
title('Iron(Fe)')

%Tungsten (W)
S11=2.45;
S12=-0.69;
S44=6.22;
Etheta = (0.5*(S11+S12)+0.5*(S11-S12)*(cos(2*theta)).^2+0.25*S44*(sin(2*theta)).^2).^-1;
figure(2)
polar(theta,Etheta)
xlabel({'E_{\theta}(TPa)'},'FontSize',20);
ylabel({'\theta'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
title('Tungsten (W)')

%Niobium (Nb)
S11=6.50;
S12=-2.23;
S44=35.44;
Etheta = (0.5*(S11+S12)+0.5*(S11-S12)*(cos(2*theta)).^2+0.25*S44*(sin(2*theta)).^2).^-1;
figure(3)
polar(theta,Etheta)
xlabel({'E_{\theta}(TPa)'},'FontSize',20);
ylabel({'\theta'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
title('Niobium (Nb)')
