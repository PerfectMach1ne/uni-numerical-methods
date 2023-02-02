function y=func(t)
    y=0.2*exp(2.5*sin(10*t))-1.9*exp(-2*t)
endfunction
a=0;
b=1;
n=20;
S=0;
for k=1:n
    S=S+((b-a)/n)*func(k*(b-a)/n);
end
disp(S);
