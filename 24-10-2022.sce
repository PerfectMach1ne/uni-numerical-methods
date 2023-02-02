a = input('Podaj a: ');
b = input('Podaj b: ');
c = input('Podaj c: ');
disp('Funkcja kwadratowa y = ' + string(a) + 'x^2 + ' + string(b) + 'x + ' + string(c));
delta = b^2 + 4*a*c;
if delta > 0 then
    x1 = (-b+delta)/(2*a);
    x2 = (-b-delta)/(2*a);
    disp('x1 = ' + string(x1) + ', x2 = ' + string(x2));
elseif delta == 0 then
    x = (-b)/(2*a);
    disp('x = ' + string(x));
else
    disp('Nie ma miejsc zerowych funkcji.');
end
