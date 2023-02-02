s = input('Wybierz A lub B','string');
s = convstr(s, 'u');
select s
case 'A' then
    disp('Wybrano polecenie A')
case 'B' then
    disp('Wybrano polecenie B')
else
    disp('Wybrano niewłaściwe polecenie')
end
