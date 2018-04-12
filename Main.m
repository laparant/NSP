function [] = Main()
% Periodes P ={J,S,N} par jour sur une semaine
%contraintes : 
%   total infirmière par periode >= demande
%   1 periode travaillée -> 2 libres ensuite (contrainte de rotation)
%   nombre minimum de période par infirmière (aléatoire pour chaque)
%   max de periode par infirmère

%fonction objective  :
% Minimiser le coût et le surcout (periodes supplémentaires au min semaine)

%verification parametres :
%nb infirmière suffiant pour les contraintes

%candidat : Ninfirmière x PeriodeT
%Xit :  coût
%Tmax(i) : periode max d'une infirmière
%Tmin(i) : periode min d'une infirmière
%N(t) : infirmières désirés sur une periode t

%Test réalisable
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
