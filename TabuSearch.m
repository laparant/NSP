function TabuSearch(NSP)
%% Adding paths
addpath('Initialization')
addpath('Constraints')
addpath('Neighborhood')
addpath('Fitness')
addpath('TabuList')
addpath('Plot')

%% Initialization
global S;
global BestCost
global Time;
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

% Initialize time
Time = [];

%% Termination condition : all constraints fulfilled or Gmax reached
while G < NSP.Gmax && Fitness(NSP,S) ~= 0
    % Beginning of iteration
    tic;
    
    % Generating neighborhood of S
    [N,Nmvt] = Neighborhood(NSP,S,TabuList);
    
    % Evaluating the neighboorhood
    NFitness = FitnessN(NSP,N);
    
    % Selecting next solution
    [S,mvt] = nextSolution(N,Nmvt,NFitness);
    
    % Update tabu list
    TabuList = updateTabuList(NSP,mvt, TabuList);
    
    % End of iteration
    Time = [Time toc];
    
    % Update G
    G = G + 1;
    
    % Show Iteration Information
    fprintf("[Tabu Search] Iterarion %d : %d\n",G,Fitness(NSP,S));
    
    % Add Fitness Value to BestCost
    BestCost = [BestCost Fitness(NSP,S)];
    
    % Plot Best Solution
    PlotSolution(S,G,BestCost(end));
    
end

% Plot BestCost
PlotBestCosts(BestCost);

% Plot time
PlotTime(Time)

%% Removing paths
rmpath('Initialization')
rmpath('Constraints')
rmpath('Neighborhood')
rmpath('Fitness')
rmpath('TabuList')
rmpath('Plot')
end