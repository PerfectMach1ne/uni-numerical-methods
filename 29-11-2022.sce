// Przykład metody węzłowej
// T5G 5.1 p.105,112-113
clear;clc;
// Dane: impendancje gałęzi
Z1=10;
Z2=10+10*%i;
Z3=5-10*%i;
Z4=-10*%i;
// Dane: Parametry źródeł
Izr1=2+%i;
Izr4=1;
E2=50;
E3=10-20*%i;
E4=-50*%i;
// Macierz incydencyjna węzłowa (uziemiona)
A=[1,0,0,1;0,-1,1,-1];
//macierz diagonalna admitancji
Yd=diag([1/Z1,1/Z2,1/Z3,1/Z4]);
//macierz kolumnowa źródeł napięcia;
Eg=[0;E2;E3;E4];
// macierz kolumnowa źródeł prądu
Iz=[Izr1;0;0;-Izr4];
//macierz admitancji własnych i wzajemnych;
Y=A*Yd*A';
// potencjły weżłow
Uw=inv(Y)*A*(Iz-Yd*Eg);
// napiecia na galeziach
U=A'*Uw;
// prądy w gałęziach
Ig=Yd*(U+Eg);
// wartosci skuteczne prądów w gałęziach
Igs=abs(Ig);
// wyswietlenie wynikow
disp(Ig, 'wartości zespolone prądów');
disp(Igs, 'wartości skuteczne prądów');
