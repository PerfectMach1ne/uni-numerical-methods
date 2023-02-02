// Doolittle decomposition method 
// chapter 6.3.

clear;clc;
// macierz współczynników
A = [10, 3, -2; -5, 10, -1; 4, 5, 20];
// wektor wyrazów wolnych
B = [10; 12; 74];
// określenie stopnia macierzy A
// (liczby wierszy)
n = size(A, 'r');
// macierz jednostkowa
L = eye(n, n);
// macierz zerowa
U = zeros(n, n);

// dekompozycja LU
for i = 1:n
    // wyznaczanie wartości wiersza macierzy U
    // od przekątnej głównej w prawo
    for j = i:n
        suma = 0;
        for k = 1:i-1 do
            suma = suma + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - suma;
    end
    // wyznaczanie wartości kolumny macierzy L
    // poniżej głównej przekątnej
    for j = i+1:n
        suma = 0;
        for k = 1:i-1 do
            suma = suma + L (j,k)*U(k,i);
        end
        L(j,i) = (A(j,i) - suma)/U(i,i);
    end
end

// wyznaczenie wektora Z
for i = 1:n
    suma = 0;
    for j = 1:i-1
        suma = suma + L(i,j)*Z(j);
    end
    Z(i) = B(i) - suma;
end

// wyznaczenie rozwiązania X
for i = n:-1:1
    suma = 0;
    for j = i+1:n
        suma = suma + U(i,j)*X(j);
    end
    X(i) = (Z(i) - suma)/U(i,i);
end

disp(X, 'Rozwiązanie metodą Doolittle''a');
