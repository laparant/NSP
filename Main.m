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

P.X(1:4,1:4)=-1;
P.N=[2,1,1,1];
P.Tmin=[1,1,1,1];
P.Tmax=[2,2,1,2];
P.s = 3;
P.C = [6 6 6 6; 4 4 4 4; 5 5 5 5; 2 2 2 2];
S = RandomSolve(P);
TS(P,100)

%GRASP
%Parameters
nbIteration = 1000;
%Algorithm execution
[BestSolution ObjectiveValues]= GRASP(P,nbIteration);
plot(ObjectiveValues);
end
