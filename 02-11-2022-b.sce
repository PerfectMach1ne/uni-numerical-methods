clear;clc;clf;
function z=surf(x, y)
    z=cos(y)*sin(x);
endfunction
k=20;
x=linspace(0,%pi,k);
y=linspace(0,%pi,k);
for i=1:k
    for j=1:k
        z(i,j)=surf(x(i),y(j));
    end
end
subplot(121);
plot3d(x,y,z);
subplot(122);
colorbar(min(z),max(z));
plot3d1(x,y,z);
