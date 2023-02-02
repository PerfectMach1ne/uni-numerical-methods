// Zadanie z Rozdziału 4
clear;clc;
// Dane
Z1=6+1+3
Z2=5
Z3=2.22
Z4=2
Z5=1
Z6=3
Z7=1
Z8=3.42

// Macierz strukturalna węzłowa
A=[1,0,0,0,0,0,-1,-1;
   -1,1,1,0,0,0,0,0;
   0,-1,0,1,0,-1,0,0;
   0,0,-1,-1,1,0,1,0;
   0,0,0,0,-1,1,0,1];
// Macierz strukturalna oczkowa
B=[1,0,1,0,0,0,1,0;
   0,1,-1,1,0,0,0,0;
   0,0,0,-1,-1,-1,0,0;
   0,0,0,0,1,0,-1,1];
// macierz diagonalna impendancji
Zd=diag([Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8]);
// macierz diagonalna admitancji
Yd=diag([1/Z1,1/Z2,1/Z3,1/Z4,1/Z5,1/Z6,1/Z7,1/Z8]);
// macierz kolumnowa źrodel napiecia
Eg=[200;0;0;0;100;0;0;0];
// macierz kolumnowa zrodel pradu (brak)
Iz=zeros(8,1);
// a) METODA WĘZŁOWA
// macierz admitancji własnych i wzajemnych
Y = A*Yd*A';
// macierz potencjalow wezlowych
// METODA POPRAWNA, ALE ZADANIA NIE DA SIĘ POPRAWNIE ROZWIĄZAĆ
// METODĄ WĘZŁOWĄ, BO MACIERZ Y NIE JEST ODWRACALNA I DLATEGO
// SCILAB ZAOKRĄGLA WYNIKI, PRZEZ CO WYNIKI Ig_oczk i Ig_wezl
// SĄ ROZBIEŻNE.
Uw=inv(Y)*A*(Iz-Yd*Eg);
// napiecia w galeziach obwodu
U=A'*Uw;
// Prady w galeziach (ROZWIAZANIE)
Ig_wezl=Yd*(U+Eg);
// b) METODA OCZKOWA
// macierz impendancji własnych i wzajemnych
Z=B*Zd*B';
// Prądy oczkowe
Io=inv(Z)*B*(Eg-Zd*Iz);
// Prądy wypadkowe gałęzi uogolnionych
I=B'*Io;
// prady w galeziach (ROZWIĄZANIE)
Ig_oczk=I+Iz;

disp(Ig_wezl, 'Wartości prądów (metoda węzłowa)');
disp(Ig_oczk, 'Wartości prądów (metoda oczkowa)');
