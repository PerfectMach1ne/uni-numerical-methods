clear;clc;clf;
Em=120;
R=5;
L=30*10^-3;
C=0.5*10^-3;
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
E=Em/sqrt(2);
Z=R+%i*(omega *L-1/(omega *C));
I=E/Z;
Im=abs(I)*sqrt(2);
fiI=atan(imag(I),real(I));
UR=I*R;
UL=I*omega*L*%i;
UC=I/(%i*omega*C);

subplot(121);
plot2d(t,[napiecie(t)' prad(t)' 0.1*moc(t)']);
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
legends(['e(t) - napięcie generatora';'i(t) - prąd obwodu';'p(t) - moc chwilowa w obwodzie'],[1 2 3],opt='lr');
xlabel('t [s]', 'position', [0.102 5],'fontsize', 2);
ylabel('e(t), i(t), 10% p(t)', 'position', [-0.007 180],'fontname', 0, 'fontsize', 2,'rotation', 90);

subplot(122);
URx=[0,real(UR)];
URy=[0,imag(UR)];
ULx=[real(UR),real(UL)+real(UR)];
ULy=[imag(UR),imag(UL)+imag(UR)];
UCx=[real(UL)+real(UR),real(UC)+real(UL)+real(UR)];
UCy=[imag(UL)+imag(UR),imag(UC)+imag(UL)+imag(UR)];
plot2d4(URx,URy,3);
plot2d4(ULx,ULy,5);
plot2d4(UCx,UCy,9);
Ex=[0,E];
Ey=[0,0];
plot2d4(Ex,Ey);
Ix=[0,real(I)];
Iy=[0,imag(I)];
plot2d4(Ix,Iy,2);
legends(['E - napęcie generatora';'I - prąd obwodu';'UR - napięcie rezystora';'UL - napięcie cewki';'UC - napięcie kondensatora'],[1 2 3 5 9],opt='lr');
ster_axe=gca();
ster_axe.x_location="origin";
ster_axe.y_location="origin";
xlabel('real', 'position', [140 2.5], 'fontsize', 2);
ylabel('imag', 'position', [-8 75], 'rotation', 90, 'fontname', 0, 'fontsize', 2);
