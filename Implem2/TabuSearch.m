function S = TabuSearch(NSP)
%% Adding paths
addpath('Initialization')
addpath('Constraints')
addpath('Neighborhood')
addpath('Fitness')
addpath('TabuList')

%% Initialization
% Randomly create the first solution
S = GenerateRandomSolution(NSP);
% Initializing Tabu List
TabuList = zeros(size(S,2),size(S,1),size(S,1));
% Initializing G
G = 0;

%% Termination condition : all constraints fulfilled or Gmax reached
while G < NSP.Gmax && Fitness(NSP,S) ~= 0
    disp(G)
    % Generating neighborhood of S
    [N,Nmvt] = Neighborhood(NSP,S);
    
    % Evaluating the neighboorhood
    NFitness = FitnessN(NSP,N);
    
    % Selecting next solution
    [S,mvt] = nextSolution(N,Nmvt,NFitness,TabuList);
    
    % Update tabu list
    TabuList = updateTabuList(mvt, TabuList);
    
    % Update G
    G = G + 1;
end

%% Removing paths
rmpath('Initialization')
rmpath('Constraints')
rmpath('Neighborhood')
rmpath('Fitness')
rmpath('TabuList')
end