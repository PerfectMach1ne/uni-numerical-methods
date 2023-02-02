m = input('Podaj listę liczb (jako macierz):')
u = 0 // Srednia (arytmetyczna)
v = 0 // Wariancja
for i = m
    u = u + i;
end
u = u / length(m);
for i = m
    vp = (i - u)^2;// Wariancja dla danego punktu danych
    v = v + vp;
end
v = v / length(m);
sd = sqrt(v) // Odchylenie standardowe
