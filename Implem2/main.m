%% Defining NSP (Nurse Scheduling Problem)
% Gmax : maximum number of iterations
NSP.Gmax = 100;
% Number of nurses
NSP.nurses = 10;
% Number of periods
NSP.periods = 21;
% Number of nurses required by period
NSP.N=[repmat([3,2,1],1,5) repmat([4,2,1],1,2)];
% Minimal number of periods to work by nurses
NSP.Tmin = [repmat(2,1,2) repmat(4,1,8)];
% Maximal number of periods to work by nurses
NSP.Tmax = [repmat(3,1,2) repmat(7,1,8)];

% Launching Tabu Search
disp(TabuSearch(NSP));