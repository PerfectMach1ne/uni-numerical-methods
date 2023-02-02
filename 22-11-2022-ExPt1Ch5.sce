// 5. badanie przebiegu funkcji
clear;clc;clf;
function y=g(x)
    y=%e^x^2
endfunction
disp('Dziedzina: R');
disp('Brak miejsc zerowych');
disp('Punkt przecięcia z osią Oy/wartość funkcji w ekstremum:', g(0));
disp('Przedziały monotoniczności: Rosnąca w (0,%inf) i malejąca w (-%inf,0)');
disp('Ekstremum: x = 0')

t=linspace(0,1,2000);
subplot(211);
plot2d(t,g(t));
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";

subplot(212);
f_ = g(t);
df = diff(f_,1);
t=linspace(0,1,1999);
plot2d(t,df);
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
