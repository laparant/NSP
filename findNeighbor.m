function [bestS] = findNeighbor(P,S)
bestS = S;
bestOV = ObjectiveValue(P,S);

% Pour chaque ligne, faire tous les swaps possibles
for i=1:1:size(S,1)
    i_fixed = i;
    for j=1:1:size(S,1)
        % Effectuer le swap
        A = S;
        A(j,:) = S(i_fixed,:);
        A(i_fixed,:) = S(j,:);
        % Calculer le coût et enregistrer la solution si meilleure
        if IsLegal(P,A) && ObjectiveValue(P,A) < bestOV
            bestOV = ObjectiveValue(P,A);
            bestS = A;
        end
    end
end
end