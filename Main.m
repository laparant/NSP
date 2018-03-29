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
%N(t) : infirmières

end
