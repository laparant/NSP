function TabuSearch(NSP)
%% Adding paths
addpath('Initialization')
addpath('Constraints')
addpath('Neighborhood')
addpath('Fitness')
addpath('TabuList')
addpath('Plot')

%% Initialization
% Close previous plot
close all;

% Randomly create the first solution
S = GenerateRandomSolution(NSP);
% Initializing Tabu List
TabuList = zeros(size(S,2),size(S,1),size(S,1));
% Initializing G
G = 0;
% Array to Hold Iteration Best Cost
BestCost=[Fitness(NSP,S)];

%% Termination condition : all constraints fulfilled or Gmax reached
while G < NSP.Gmax && Fitness(NSP,S) ~= 0
    
    % Generating neighborhood of S
    [N,Nmvt] = Neighborhood(NSP,S,TabuList);
    
    % Evaluating the neighboorhood
    NFitness = FitnessN(NSP,N);
    
    % Selecting next solution
    [S,mvt] = nextSolution(N,Nmvt,NFitness);
    
    % Update tabu list
    TabuList = updateTabuList(mvt, TabuList);
    
    % Update G
    G = G + 1;
    
    % Show Iteration Information
    fprintf("Iterarion %d : %d\n",G,Fitness(NSP,S));
    
    % Add Fitness Value to BestCost
    BestCost = [BestCost Fitness(NSP,S)];
    
    % Plot Best Solution
    figure(1);
    PlotSolution(S,G);
    pause(1);
    
end

% Plot BestCost
figure(2);
PlotBestCosts(BestCost);

%% Removing paths
rmpath('Initialization')
rmpath('Constraints')
rmpath('Neighborhood')
rmpath('Fitness')
rmpath('TabuList')
rmpath('Plot')
end