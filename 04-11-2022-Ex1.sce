clear;clc;clf;
Em=75*sqrt(2);
R1=2;
R2=4;
L=40*10^-3;
C=0.57*10^-3;
f=50;
omega=2*%pi*f;

function e=napiecie(t)
    e=Em*sin(omega*t);
endfunction
function i=prad(t)
    i=Im*sin(omega*t+fiI);
endfunction
function p=moc(t)
    p=napiecie(t).*prad(t);
endfunction

t=linspace(0,5/f,1000);

E=Em/sqrt(2); // Wartość skuteczna
