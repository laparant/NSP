function [best,mvt] = nextSolution(N,Nmvt,NFitness)
% Find index of best elements, if several minimum, randomly select
i = datasample(find(NFitness==min(NFitness)),1);

% Returning selected element and associated move
best = N(:,:,i);
mvt = Nmvt{i};
end