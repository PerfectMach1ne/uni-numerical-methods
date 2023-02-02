function w = pierwiastek(x)
    w = sqrt(x)
endfunction

function [a,g] = srednie(x,y)
    a = (x + y) / 2;
    g = sqrt(x*y);
endfunction

deff('[k,s] = kw_sz(x)','k=x*x; s=x*x*x')

x = log10(100);
p2 = pierwiastek(2);
[arytm, geometr] = srednie(2,3);
[kwad, szesc] = kw_sz(4)
