function [] = Main()
% Periodes P ={J,S,N} par jour sur une semaine
%contraintes : 
%   total infirmi�re par periode >= demande
%   1 periode travaill�e -> 2 libres ensuite (contrainte de rotation)
%   nombre minimum de p�riode par infirmi�re (al�atoire pour chaque)
%   max de periode par infirm�re

%fonction objective  :
% Minimiser le co�t et le surcout (periodes suppl�mentaires au min semaine)

%verification parametres :
%nb infirmi�re suffiant pour les contraintes

%candidat : Ninfirmi�re x PeriodeT
%Xit :  co�t
%Tmax(i) : periode max d'une infirmi�re
%Tmin(i) : periode min d'une infirmi�re
%N(t) : infirmi�res d�sir�s sur une periode t

%Test r�alisable
%Model parameters

P.X(1:60,1:21)=-1;
P.N=[repmat([20,15,10],1,5) repmat([30,20,10],1,2)];
P.Tmin=[repmat(2,1,8) repmat(4,1,52)];
P.Tmax=[repmat(3,1,8) repmat(7,1,52)];
P.s = 150;
P.C = repmat([repmat([150 200 200],1,5) repmat([200 250 250],1,2)],60,1);

%GRASP
%Parameters
nbIteration = 1000;
%Algorithm execution
[BestSolution, ObjectiveValues]= GRASP(P,nbIteration);
TS(P,nbIteration);
plot(ObjectiveValues);

PlotSolution(BestSolution, P);
end
