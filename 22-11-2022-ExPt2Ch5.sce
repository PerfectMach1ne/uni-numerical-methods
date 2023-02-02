// 5. calkowanie
function y=g(x)
    y=%e^x^2
endfunction
a=0;
b=1;
N=[10,100,1000,2000,10000];
S1=0;
for n=N
    S=0;
    for k=1:n
        S=S+((b-a)/n)*g(k*((b-a)/n));
    end
    if S1 == 0 then
        S1 = S;
    else
        S1 = [S1,S];
    end
end

S2=0;
for n=N
    S=0;
    for k=1:n-1
        S=S+g(a+k*(b-a)/n)
    end
    S=(S+(g(a)+g(b))/2)*((b-a)/n);
    if S2 == 0 then
        S2 = S;
    else
        S2 = [S2,S];
    end
end

S3=0;
for n=N
    S=0;
    for k=1:n
        t=linspace(a,b,n);
        S=intsplin(t,g(t));
    end
    if S3 == 0 then
        S3 = S;
    else
        S3 = [S3,S];
    end
end

S = [N',S1',S2',S3'];
label = ['Dokładność','M. prostok.','M. trapezów','M. f. sklejanych']
disp(label,S);
