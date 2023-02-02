function res = factorial(n)
    if n < 0 then
        res = 'nie.'
    elseif n == 0
        res = 1
    else
        res = n
        res = res * factorial(n-1)
    end
endfunction
in = input('Podaj liczbe naturalną NIE MNIEJSZĄ od 0: ')
callf = string(factorial(in));
disp(callf)
