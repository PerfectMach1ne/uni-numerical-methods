n = input('Podaj liczbę liczb doskonałych do wygenerowania: ')
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
function pn = findperf(n)
    if n == 1 then
        pn = 6;
    else
        pn = 0;
        j = 1;
        jsum = 1;
        while length(pn) <= n
            // Metoda Euklidesa
            jsum = jsum + 2^j;
            j = j + 1;
            P = primes(int(round(sqrt(jsum))));
            if is_prime(jsum) == 1 then
                perfnum = jsum * 2^(j-1);
                pn = [pn, perfnum];
            end
        end
        pn(1) = [];
    end
endfunction
disp(findperf(n));
