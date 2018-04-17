function [best,mvt] = nextSolution(N,Nmvt,NFitness)
% Initializing best elements
best = N(:,:,1);
bestValue = size(N,1)*size(N,2);
mvt = Nmvt{1};

% Finding the best element
for i=2:1:size(N,3)
    if NFitness(i) < bestValue
        bestValue = NFitness(i);
        best = N(:,:,i);
        mvt = Nmvt{i};
    end
end
end