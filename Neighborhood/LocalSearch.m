function [S] = LocalSearch(NSP,S)
% Cost of S
costS = Fitness(NSP,S);
% Generating and evaluating neighborhood
[N,Nmvt] = NeighborhoodGRASP(NSP,S); % Generating neighborhood
NFitness = FitnessN(NSP,N); % Evaluating neighborhood

while (min(NFitness) < costS)
    [S,~] = nextSolution(N,Nmvt,NFitness); % Selecting best candidate
    costS = Fitness(NSP,S);
    % Generating and evaluating new neighborhood
    [N,Nmvt] = NeighborhoodGRASP(NSP,S); % Generating neighborhood
    NFitness = FitnessN(NSP,N); % Evaluating neighborhood
end

end