clear
x = input('Podaj liczbę naturalną > 1: ');
i=2;
while i < x do
    if modulo(x,i) == 0 break; end
    i = i + 1;
end
if i == x then
    disp('Liczb a pierwsza')
end
