// Ch6 Ex, Part 1
clear;clc;
Z1=6+1+3
Z2=5
Z3=2.22
Z4=2
Z5=1
Z6=3
Z7=1
Z8=3.42

S=[1,0,1,0,0,0,1,0;
   0,1,-1,1,0,0,0,0;
   0,0,0,-1,-1,-1,0,0;
   0,0,0,0,1,0,-1,1];
Zd=diag([Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8]);
A=S*Zd;

Eg=[200;0;-100;100];
B=Eg;

AB=[A B];

L = tril(A,-1);
U = triu(A,1);
listaD = diag(A);
lista_invD = listaD^(-1);
iD = diag(lista_invD);

eps = 0.002;
nmax = 100;
n = 1;
X(:,n) = B;

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

Xtest=linsolve(A,-B);
