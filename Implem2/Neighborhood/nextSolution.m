function [best,mvt] = nextSolution(N,Nmvt,NFitness,TabuList)
% Initializing best elements
bestN(1:size(N,1),1:size(N,2)) = -1;
bestNValue = size(N,1)*size(N,2);
mvtN = Nmvt{1};

% Intializing best Tabu element (aspiration criterion)
bestTabu = bestN;
bestTabuValue = bestNValue;
mvtTabu = mvtN;

% Finding the best element
for i=1:1:size(N,3)
    if TabuList(Nmvt{i}(1),Nmvt{i}(2),Nmvt{i}(3)) == 0
        if NFitness(i) < bestNValue
            bestNValue = NFitness(i);
            bestN = N(:,:,i);
            mvtN = Nmvt{i};
        end
    else
        if NFitness(i) < bestTabuValue
            bestTabuValue = NFitness(i);
            bestTabu = N(:,:,i);
            mvtTabu = Nmvt{i};
        end
    end
end

% Applying aspiration criteria : if Tabu value is better, ignore Tabu
if bestTabuValue < bestNValue
    best = bestTabu;
    mvt = mvtTabu;
else
    best = bestN;
    mvt = mvtN;
end
end