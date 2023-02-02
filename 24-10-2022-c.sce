function res = factorial(n)
    if n < 0 then
        res = 'nie.'
    elseif n == 0
        res = 1
    else
        res = 1
        for i = 1:n
            res = res * i
            disp(string(res) + ' ' + string(i))
        end
    end
endfunction
in = input('Podaj liczbe naturalną NIE MNIEJSZĄ od 0: ')
callf = string(factorial(in));
disp(callf)
