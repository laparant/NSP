% Calculate the fitness value which is the sum of penalties depending on
% line contstraints violation
function [ value ] = Fitness(NSP, X)
value = 0;
% Penalty constants
Ptmin = 10;
Ptmax = 10;
P2free = 10;
Povercost = 1;

% Line constraints
for i=1:1:size(X,1)
    % Tmin, Tmax : hard constraints
    if sum(X(i,:)) < NSP.Tmin(i)
        value = value + Ptmin*(NSP.Tmin(i)-sum(X(i,:)));
    elseif sum(X(i,:)) > NSP.Tmax(i)
        value = value + Ptmax*(sum(X(i,:))-NSP.Tmax(i));
    end
    
    % Overcost (working more than Tmin) : soft constraint
    if sum(X(i,:)) > NSP.Tmin(i)&& sum(X(i,:)) < NSP.Tmax(i)
        value = value + Povercost*(sum(X(i,:))-NSP.Tmin(i));
    end
    
    % 2 free periods : hard constraint
    for j=1:1:size(X,2)-2
        if X(i,j) + X(i,j+1) + X(i,j+2) > 1
            value = value + P2free;
        end
    end
end
end

