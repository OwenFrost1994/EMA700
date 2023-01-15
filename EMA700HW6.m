clear
clc
close all

E = 70E9;%Pa
v = 0.3;
R = 1;%mm
d = 0:0.01:0.4;%mm

for i = 1:1:size(d,2)
    F(i) = (4/3)*(E/(1-v^2))*(0.001*R)^(1/2)*(0.001*d(i))^(3/2);
end
%% In rigid intender case, the Young's modulus of intender is 100 times as Young's modulus in substrate
F_C=-[0.0000,-55.186,-183.19,-374.27,-593.37,-855.64,-1116.1,-1443.2,-1765.4,-2101.8,-2455.7,-2846.1,-3225.3,-3583.7,-4008.8,-4441.0,-4850.9,-5237.7,-5679.5,-6100.1,-6538.0,-6988.4,-7410.5];
figure(1)
plot(d,F,'r-','Markersize',6,'LineWidth',2)
hold on
plot(0:0.01:0.01*(size(F_C,2)-1),F_C,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'d(mm)'},'FontSize',20);
ylabel({'Pa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('Analytical','COMSOL')
title('Rigid Indenter')

%%In deformable intender case, the Young's modulus of intender is same as Young's modulus in substrate
F_C=-[0,-39.023,-116.98,-234.77,-367.54,-525.27,-691.62,-885.90,-1093.8,-1302.9,-1540.9,-1787.0,-2047.6,-2301.8,-2573.0,-2877.0,-3173.8,-3463.2,-3776.6,-4103.4,-4422.6,-4775.5,-5121.8,-5459.4,-5787.8,-6153.7,-6541.8,-6919.9,-7287.7,-7644.8,-8003.2,-8412.4,-8811.2,-9199.4,-9576.5,-9942.4,-10297,-10625];

figure(2)
plot(d,F,'r-','Markersize',6,'LineWidth',2)
hold on
plot(0:0.01:0.01*(size(F_C,2)-1),F_C,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'d(mm)'},'FontSize',20);
ylabel({'Pa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('Analytical','COMSOL')
title('Deformable Indenter')

%% Because the above cases are in large deformation, I testified in small deformation with refined mesh.
d = 0:0.001:0.01;%mm

for i = 1:1:size(d,2)
    FR(i) = (4/3)*(E/(1-v^2))*(0.001*R)^(1/2)*(0.001*d(i))^(3/2);
end

F_C = -[0.0000 -2.2711 -7.0979 -13.622 -21.506 -30.574 -40.729 -51.762 -63.555 -76.320 -89.519];
figure(3)
plot(d,FR,'r-','Markersize',6,'LineWidth',2)
hold on
plot(d,F_C,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'d(mm)'},'FontSize',20);
ylabel({'Pa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('Analytical','COMSOL')
title('Rigid Indenter Small Deformation (100 times)')

F_C = -[0.0000 -1.3529 -4.0113 -7.6294 -11.927 -16.927 -22.406 -28.347 -34.971 -41.853 -49.219];

figure(4)
plot(d,FR,'r-','Markersize',6,'LineWidth',2)
hold on
plot(d,F_C,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'d(mm)'},'FontSize',20);
ylabel({'Pa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('Analytical','COMSOL')
title('Deformable Indenter Small Deformation')
%% It can be seen that in the large deformation cases,
%the analytical solution cannot be a good solution just because the over
%large deformation violated the preconditions for building the solution.
%But in small deformation cases the rigid intender matches the analytical
%solution better because it approaches the analytical solution's rigid body
%assumption better.
%As for the deformable intender it is meaning less.
%The von-Mises stress on the deformed shape is shown in the COMSOL file I
%attached in the Canvas.