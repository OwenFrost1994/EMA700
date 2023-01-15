clear
clc
close all

E = 70E9;
v = 0.25;
P = 150E6;
e = 1E-3;

a = 2;
b = 2.2177;
c = 2.6762;

A = (1-2*v)*(b^2-c^2)*e/(2*(1-v)*(c^2-a^2)) + P*(1+v)*(1-2*v)*a^2/(E*(c^2-a^2));
H = (1-2*v)*(b^2-a^2)*e/(2*(1-v)*(c^2-a^2)) + P*(1+v)*(1-2*v)*a^2/(E*(c^2-a^2));
B = (b^2-c^2)*a^2*e/(2*(1-v)*(c^2-a^2)) + P*(1+v)*a^2*c^2/(E*(c^2-a^2));
D = (b^2-a^2)*c^2*e/(2*(1-v)*(c^2-a^2)) + P*(1+v)*a^2*c^2/(E*(c^2-a^2));
r = a:0.01:b;
for i = 1:1:size(r,2)
    sigma_rr1(i) = E*A/((1+v)*(1-2*v))-E*B/((1+v)*r(i)^2);
    sigma_ss1(i) = E*A/((1+v)*(1-2*v))+E*B/((1+v)*r(i)^2);
end
figure(1)
plot(r,sigma_rr1/1E6,'r-','Markersize',6,'LineWidth',2)
hold on
plot(r,sigma_ss1/1E6,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'r(cm)'},'FontSize',20);
ylabel({'MPa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('\sigma_{rr}','\sigma_{\theta\theta}')
title('Inner cylinder')

r = b:0.01:c;
for i = 1:1:size(r,2)
    sigma_rr2(i) = E*H/((1+v)*(1-2*v))-E*D/((1+v)*r(i)^2);
    sigma_ss2(i) = E*H/((1+v)*(1-2*v))+E*D/((1+v)*r(i)^2);
end
figure(2)
plot(r,sigma_rr2/1E6,'r-','Markersize',6,'LineWidth',2)
hold on
plot(r,sigma_ss2/1E6,'b-','Markersize',6,'LineWidth',2)
hold on
xlabel({'r(cm)'},'FontSize',20);
ylabel({'MPa'},'FontSize',20);
set(gca, 'FontName','Times New Roman','FontSize', 20)
legend('\sigma_{rr}','\sigma_{\theta\theta}')
title('Outer cylinder')
