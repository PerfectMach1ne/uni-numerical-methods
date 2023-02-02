function y=func(t)
    y=0.2*exp(2.5*sin(10*t))-1.9*exp(-2*t)
endfunction
a=0;
b=1;
n=20;
S=0;
for k=1:n-1
    S=S+func(a+k*(b-a)/n)
end
S=(S+(func(a)+func(b))/2)*((b-a)/n);
disp(S);
