// cHAPTER 6.2
//GAUSS jordan elimination method
// uygshitre2o5uftrw09tpd

clear;clc;
// przeprowadzono wcześniej wybór elementu podstawowego
A = [10, 3, -2; -5, 10, -1; 4, 5, 20];
B = [10; 12; 74];
// sklejenie powyższych czyli macierz rozszerzona
AB = [A B];

// sprowadzenie pozycji 1,1 do jedności
AB(1,:)=AB(1,:)/AB(1,1);
// eliminacja pierwszej niewiadomej z 2. równania
AB(2, :) = AB(2, :) - AB(2, 1) * AB(1, :);
// eliminacja pierwszej niewiadomej z 3. równania
AB(3, :) = AB(3, :) - AB(3, 1) * AB(1, :);
// powrót do trzeciego punktu algorytmu
// sprowadzenie pozycji 2,2 do jedności
AB(2,:)=AB(2,:)/AB(2,2);
// eliminacja drugiej niewiadomej z 1. równania
AB(1, 2:$) = AB(1, 2:$) - AB(1, 2) * AB(2, 2:$);

// eliminacja drugiej niewiadomej z 3. równania
AB(3, 2:$) = AB(3, 2:$) - AB(3, 2) * AB(2, 2:$);
// powrót do trzeciego punktu algorytmu
// sprowadzenie pozycji 3,3 do jedności
AB(3,:)=AB(3,:)/AB(3,3);
// eliminacja trzeciej niewiadomej z 1. równania
AB(1, 3:$) = AB(1, 3:$) - AB(1, 3) * AB(3, 3:$);
// eliminacja trzeciej niewiadomej z 2. równania
AB(2, 3:$) = AB(2, 3:$) - AB(2, 3) * AB(3, 3:$);
// rozwiązanie jest w ostatniej kolumnie macierzy AB
X=AB(:,4);

// dla sprawdzenia porównanie z wynikiem funkcji linsolve()
Xtest = linsolve(A, -B);
disp(Xtest, 'rozwiązanie wzorcowe');
disp(X, 'rozwiązanie metodą Gaussa-Jordana');
