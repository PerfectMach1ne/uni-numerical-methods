// 6.6. gauss-seidl iteration approximation these nuts asasdfdklgfd

clear
clc
// macierz współczynników
A = [10, 3, -2; -5, 10, -1; 4, 5, 20];
// wektor wyrazów wolnych
B = [10; 12; 74];

// macierz trójkątna dolna L+D
LD = tril(A);
// macierz naddiagonalna
U = triu(A,1);
// utworzenie macierzy L+D odwrotnej
// tym razem z wykorzystaniem algorytmów Scilab-a
iLD = LD^(-1);
// warunek zbieżności rozwiązania
eps = 0.002;
// dopuszczalna liczba iteracji
nmax = 100;

// początkowe przybliżenie rozwiązania
n=1;
X=B;
while n < nmax do
    // zapamiętanie poprzedniego przybliżenia
    pX=X;
    // zliczanie iteracji
    n = n + 1;
    // obliczanie nowego przybliżenia element po elemencie
    // z wykorzystaniem wszystkich dostępnych wyników
    for i=1:3 do
        X(i) = iLD(i,:) * (B - U * X);
    end
    // sprawdzenie zbieżności
    if abs(X - pX) <= eps then
        break
    end
end
disp(n-1, 'Liczba iteracji');
disp(X, 'Przybliżone rozwiązanie układu równań');
