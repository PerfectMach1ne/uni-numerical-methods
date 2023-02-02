n = input('Podaj liczbę naturalną > 1: ')
P = primes(int(round(sqrt(n))))
function p = is_prime(n)
    for i = P
        if modulo(n,i) == 0 then
            p = 0;
            break;
        else
            p = 1;
        end
    end
endfunction
if is_prime(n) == 0 then
    disp('Liczba złożona')
elseif is_prime(n) == 1 then
    disp('Liczba pierwsza')
end
