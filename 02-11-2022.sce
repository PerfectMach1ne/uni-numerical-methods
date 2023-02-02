clear;clc;clf;
function z=surf(x, y)
    z=cos(y)*sin(x);
endfunction
k=200;
x=linspace(0,%pi,k);
y=linspace(0,%pi,k);
for i=1:k // obliczenie wartości funkcji wymagane do
    for j=1:k // odszukania wartości min i max
        z(i,j)=surf(x(i),y(j));
    end
end
Sfgrayplot(x,y,surf); // wykreślanie mapy
colorbar(min(z),max(z));//wykreślanie skali barwnej
