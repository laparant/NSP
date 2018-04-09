function [bestS] = findNeighbor(P,S)
bestS = S;
bestOV = ObjectiveValue(P,S);

% Ligne fix�e pour le swap
i_fixed = randi(size(S,1));
for i=1:1:size(S,1)
% Effectuer le swap
A = S;
A(i,:) = S(i_fixed,:);
A(i_fixed,:) = S(i,:);
% Calculer le co�t et enregistrer la solution si meilleure
if IsLegal(P,A) && ObjectiveValue(P,A) < bestOV
    bestOV = ObjectiveValue(P,A);
    bestS = A;
end
end
end