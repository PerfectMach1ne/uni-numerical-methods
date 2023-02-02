clear;clc;clf;
function z=surf(x, y)
    z=cos(y)*sin(x);
endfunction
k=200;
x=linspace(0,%pi,k)
y=linspace(0,%pi,k)
for i=1:k
    for j=1:k
        z(i,j)=surf(x(i),y(j));
    end
end
subplot(1,2,1);
histplot(10,z,normalization=%f);
subplot(1,2,2);
histplot(10,z);
