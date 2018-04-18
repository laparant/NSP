function [TotalTime, G] = GRASP(NSP)
%% Adding paths
addpath('Initialization')
addpath('Constraints')
addpath('Neighborhood')
addpath('Fitness')
addpath('Plot')

%% Initialization
global bestS;
global BestCost
global Time;
% Close previous plot
close all;

% Randomly create the first solution
bestS = GenerateRandomSolution(NSP);
best = Fitness(NSP,bestS);

% Initializing G
G = 0;
% Array to Hold Iteration Best Cost
BestCost=[best];

% Initialize time
Time = [];

%% Termination condition : all constraints fulfilled or Gmax reached
while G < NSP.Gmax && best ~= 0
    % Beginning of iteration
    tic;
    
    % Randomly create a candidate
    S = GenerateRandomSolution(NSP);
    
    % Applying local search to candidate
    S = LocalSearch(NSP,S);
    
    % Update best solution
    if Fitness(NSP,S) < best
        bestS = S;
        best = Fitness(NSP,S);
    end
    
    % End of iteration
    Time = [Time toc];
    
    % Update G
    G = G + 1;
    
    % Show Iteration Information
    % fprintf('[GRASP] Iterarion %d : %d\n',G,best);
    
    % Add Fitness Value to BestCost
    BestCost = [BestCost best];
    
    % Plot Best Solution
    %PlotSolution(bestS,G,best);
    
end

% Plot BestCost
%PlotBestCosts(BestCost);

% Plot time
%PlotTime(Time);

TotalTime = sum(Time);

%% Removing paths
rmpath('Initialization')
rmpath('Constraints')
rmpath('Neighborhood')
rmpath('Fitness')
rmpath('Plot')
end