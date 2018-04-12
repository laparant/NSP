function [bestS,swapi,swapj] = findNeighbor(P,S)
bestS = S;
bestOV = ObjectiveValue(P,S);
swapi = -1;
swapj = -1;

% Pour chaque ligne, faire tous les swaps possibles
for i=1:1:size(S,1)-1
    for j=i+1:1:size(S,1)
        % Effectuer le swap
        A = S;
        A(j,:) = S(i,:);
        A(i,:) = S(j,:);
        % Calculer le coût et enregistrer la solution si meilleure
        if IsLegal(P,A) && ObjectiveValue(P,A) < bestOV
            bestOV = ObjectiveValue(P,A);
            bestS = A;
            swapi = i;
            swapj = j;
        end
    end
end
end