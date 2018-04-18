function TabuSearch(NSP)
%% Adding paths
addpath('Initialization')
addpath('Constraints')
addpath('Neighborhood')
addpath('Fitness')
addpath('Plot')

%% Initialization
% Close previous plot
close all;

% Randomly create the first solution
S = GenerateRandomSolution(NSP);

% Initializing G
G = 0;
% Array to Hold Iteration Best Cost
BestCost=[Fitness(NSP,S)];

%% Termination condition : all constraints fulfilled or Gmax reached
while G < NSP.Gmax && Fitness(NSP,S) ~= 0
    
    % Generating neighborhood of S
    [N,Nmvt] = NeighborhoodGRASP(NSP,S);
    
    % Evaluating the neighboorhood
    NFitness = FitnessN(NSP,N);
    
    % Selecting next solution
    [S,mvt] = nextSolution(N,Nmvt,NFitness);
        
    % Update G
    G = G + 1;
    
    % Show Iteration Information
    fprintf('Iterarion GRASP%d : %d\n',G,Fitness(NSP,S));
    
    % Add Fitness Value to BestCost
    BestCost = [BestCost Fitness(NSP,S)];
    
    % Plot Best Solution
    PlotSolution(S,G,BestCost(end));
    
end

% Plot BestCost
figure(2);
PlotBestCosts(BestCost);

%% Removing paths
rmpath('Initialization')
rmpath('Constraints')
rmpath('Neighborhood')
rmpath('Fitness')
rmpath('Plot')
end