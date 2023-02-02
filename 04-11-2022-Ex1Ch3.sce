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
// Obliczenia impendancji obwodu
XC=1/(omega*C);
XL=omega*L;
Z1=R1-%i*XC;
Z2=(R2*%i*XL)/(R2+%i*XL);
Z=Z1+Z2;

I=E/Z;  // I = I1 , E = U
Im=abs(I)*sqrt(2);
fiI=atan(imag(I),real(I));

UR1=R1*I;
UC=-%i*XC*I;
U1=UR1+UC;
U2=Z2*I;

// I = E/Z = I1 = I2+I3
I2=U2/R2;
I3=U2/(%i*XL);

// Przebiegi prądu, napięcia i mocy
subplot(121);

plot2d(t,[napiecie(t)' prad(t)' 0.1*moc(t)']);

ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
legends(['e(t) - napięcie generatora';'i(t) - prąd obwodu';'p(t) - moc chwilowa w obwodzie'],[1 2 3],opt='lr');
xlabel('t [s]', 'position', [0.102 5],'fontsize', 2);
ylabel('e(t), i(t), 10% p(t)', 'position', [-0.007 180],'fontname', 0, 'fontsize', 2,'rotation', 90);

// Wykres wskazowy
subplot(122);

// Things to plot ToDo list: U1, U2,  UC 
Ex=[0,E];
Ey=[0,0];
plot2d4(Ex,Ey,3);
UR1x=[0,real(UR1)];
UR1y=[0,imag(UR1)];
plot2d4(UR1x,UR1y,6);
U1x=[0,real(U1)];
U1y=[0,imag(U1)];
plot2d4(U1x,U1y,9);
U2x=[0,real(U2)];
U2y=[0,imag(U2)];
plot2d4(U2x,U2y,7);
I2x=[0,0];
I2y=[0,imag(I2)+imag(I3)];
plot2d4(I2x,I2y,4);
I3x=[0,real(I3)+real(I2)];
I3y=[0,0];
plot2d4(I3x,I3y,5);
Ix=[0,real(I)];
Iy=[0,imag(I)];
plot2d4(Ix,Iy,2);
UCx=[real(UR1),real(UC)+real(UR1)];
UCy=[imag(UR1),imag(UC)+imag(UR1)];
plot2d4(UCx,UCy,1);

legends(['E - napięcie generatora';'I - prąd obwodu';'I2 - napięcie I2';'I3 - napięcie I3';'UR1 - napięcie rezystora R1';'UC - napięcie kondensatora';'U1 - napięcie U1';'U2 - napięcie U2'],[3 2 4 5 6 1 9 7],opt='lr');
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
xlabel('real', 'position', [140 2.5], 'fontsize', 2);
ylabel('imag', 'position', [-8 75], 'rotation', 90, 'fontname', 0, 'fontsize', 2);
