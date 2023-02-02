// Ch6.1 thingy
// Gauss elimination method
//me when i eliminate Gauss (im an assasin in 1600)
clear;clc;
// wybór elementu podstawowego został wykonany ręcznie
// przygotowana macierz współczynników
A = [10, 3, -2; -5, 10, -1; 4, 5, 20];
// wektor wyrazów wolnych
B = [10; 12; 74];
// sklejenie powyższych czyli macierz rozszerzona
AB = [A B];

// pierwszy mnożnik eliminacji
L12 = AB(2, 1) / AB(1, 1);
// eliminacja z 2 równania
AB(2, :) = AB(2, :) - L12 * AB(1, :);
// drugi mnożnik eliminacji
L13 = AB(3, 1) / AB(1, 1);
// eliminacja z 3 równania
AB(3, :) = AB(3, :) - L13 * AB(1, :);

// powrót do trzeciego punktu algorytmu
// odrzucono z rozważań wiersz nr 1 i kolumnę nr 1
// mnożnik eliminacji
L23 = AB(3, 2) / AB(2, 2);
// eliminacja z 3 równania
AB(3, 2:$) = AB(3, 2:$) - L23 * AB(2, 2:$);
// eliminacja zakończona – warto obejrzeć jak wygląda AB

// postępowanie odwrotne – obliczanie rozwiązań od końca
X(3) = AB(3, 4) / AB(3, 3);
X(2) = (AB(2, 4) - AB(2, 3) * X(3)) / AB(2, 2);
X(1) = (AB(1, 4) - AB(1, 2) * X(2) - AB(1, 3) * X(3)) / AB(1, 1);

// dla sprawdzenia, porównanie z wynikiem działania
// funkcji Scilab-a linsolve()
Xtest = linsolve(A, -B);
disp(Xtest, 'rozwiązanie wzorcowe');
disp(X, 'rozwiązanie metodą Gaussa');
