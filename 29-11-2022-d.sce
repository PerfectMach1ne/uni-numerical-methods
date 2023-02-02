// 6.4 cholesky decomposition method

clear;clc;
// parametry zadania
n = 8; // liczba oczek
E = 100; // s. em.
R = 10; // rezystancja
// utworzenie macierzy dla metody oczkowej
// podzielono na kilka prostych etapów
// rezystancje wzajemne kolejnych oczek np. (1,2)
// czyli tworzenie wstęgi nad przekątna główną
A = diag(-R*ones(n-1,1), 1);
// rezystancje wzajemne oczek nie następujących
// po sobie oczek np. (1,8)
for i = 1:int(n/2)-1
    A(i,n-i+1) = -R;
end
// uzupełnienie macierzy symetrycznej
// poniżej głównej diagonali
A = A + A';
// rezystancje własne oczek na głównej przekątnej
A = A + eye(n, n) * 4 * R;

// utworzenie wektora wymuszeń
B(1) = E; // pierwsze oczko
B(n) = -E; // ostatnie oczko

// dekompozycja Choleskiego dla macierzy A
// zgodnie z podanymi wcześniej wzorami
for i = 1:n
    for j = 1:n
        if i == j then
            suma = 0;
            for k = 1:i-1
                suma = suma + L(i,k)*L(i,k);
            end
            L(i,i) = sqrt(A(i,i) - suma);
        elseif i > j then
            suma = 0;
            for k = 1:j-1
                suma = suma + L(i,k)*L(j,k);
            end
            L(i,j) = (A(i,j) - suma)/L(j,j);
        end
    end
end

// wyznaczenie wektora Z
for i = 1:n
    suma = 0;
    for j = 1:i-1
        suma = suma + L(i,j)*Z(j);
    end
    Z(i) = (B(i) - suma)/L(i,i);
end
// wyznaczenie rozwiązania X
U = L';
for i = n:-1:1
    suma = 0;
    for j = i+1:n
        suma = suma + U(i,j)*X(j);
    end
    X(i) = (Z(i) - suma)/U(i,i);
end

disp(X, 'Rozwiązanie (prądy oczkowe) metodą Choleskiego')
disp(linsolve(A, -B), 'Rozwiązanie wzorcowe linsolve')
