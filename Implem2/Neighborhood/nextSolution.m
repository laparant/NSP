function [bestN,mvt] = nextSolution(N,Nmvt,NFitness,TabuList)
% Initializing best elements
bestN(1:size(N,1),1:size(N,2)) = -1;
bestValue = size(N,1)*size(N,2);
mvt = Nmvt{1};

% Intializing best Tabu element (aspiration criterion)
% TODO : aspiration criterion
bestTabu = bestN;
bestTabuValue = bestValue;

% Finding the best element
for i=1:1:size(N,3)
    if NFitness(i) < bestValue
        bestValue = NFitness(i);
        bestN = N(:,:,i);
        mvt = Nmvt{i};
    end
end
end

