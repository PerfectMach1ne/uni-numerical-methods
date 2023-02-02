function y = f(x)
    if x > 0 & x <= 1 then
        y = log(x);
    elseif x > 1 & x <= 2
        y = (8*(x - 1))^(1/3);
    elseif x <= 0 | x > 2
        y = 0;
    else
        y = 'bruh';
    end
endfunction
x0 = input('Podaj liczbę: ');
y0 = f(x0);
disp(y0);
