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
