function y=funct(t)
    y=0.2*exp(2.5*sin(10*t))-1.9*exp(-2*t)
endfunction
S1=intg(0,1,funct);
disp('v = intg(a, b, f)',S1);
t=linspace(0,1,2000);
S2=inttrap(t,funct(t));
disp('v = inttrap(x,y)',S2);
S3=intsplin(t,funct(t));
disp('v = intsplin(x,y)',S3);
