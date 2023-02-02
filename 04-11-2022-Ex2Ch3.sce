clear;clf;

Q1=5;   // 5C
Q2=4;   // 4C
Q3=2;   // 2C
vr1=[2,0];
vr2=[-2,1];
vr3=[1,1.5];
r1=norm(vr1);
r2=norm(vr2);
r3=norm(vr3);

epsilon0 = 8.854187817*10^-12;

E1=Q1/(4*%pi*epsilon0*r1^3)*vr1;
E2=Q2/(4*%pi*epsilon0*r2^3)*vr2;
E3=Q3/(4*%pi*epsilon0*r3^3)*vr3;
E=norm(E1+E2+E3);
disp('Natęzenie pola elektrycznego: ', E);

x = linspace(-2,2,25);
y = linspace(-2,2,25);
[X,Y] = meshgrid(x,y);
fx = X.*E;
fy = Y.*E;
champ(x,y,fx',fy');
