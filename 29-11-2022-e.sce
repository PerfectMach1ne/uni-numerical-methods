// 6.5 iteration approximate jacobi r whatever
clear
clc
// macierz współczynników A
A = [10, 3, -2; -5, 10, -1; 4, 5, 20];
// wektor wyrazów wolnych B
B = [10; 12; 74];
// macierz poddiagonalna L
L = tril(A,-1);
// macierz naddiagonalna U
U = triu(A,1);
// współczynniki na głównej przekątnej macierzy A
listaD = diag(A);
// odwrotności tych współczynników
lista_invD = listaD^(-1);
// utworzenie macierzy diagonalnej odwrotnej
iD = diag(lista_invD);
// warunek zbieżności rozwiązania
eps = 0.002;
// maksymalna liczba iteracji
nmax = 100;
// pierwsze przybliżenie czyli B
n = 1;
X(:,n) = B;

// pętla główna programu
while n < nmax do
    n = n + 1;
    // kolejne przybliżenia
    X(:,n) = iD * (B - (L + U) * X(:,n-1));
    // sprawdzenie zbieżności rozwiązania
    if abs(X(:,n) - X(:,n-1)) <= eps then
        break
    end
end
disp(n - 1, 'Liczba iteracji');
disp(X(:,n), 'Przybliżone rozwiązanie układu równań');
