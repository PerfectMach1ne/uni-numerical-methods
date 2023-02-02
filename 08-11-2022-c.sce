clear;clc;clf;
function y=funct(t)
    y=0.2*exp(2.5*sin(10*t))-1.9*exp(-2*t)
endfunction
t=linspace(0,1,2000);
subplot(211);
plot2d(t,funct(t));
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
subplot(212);
f=funct(t);
g=diff(f,1);
t=linspace(0,1,1999);
plot2d(t,g);
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
