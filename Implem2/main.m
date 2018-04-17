%% Defining NSP (Nurse Scheduling Problem)
% Gmax : maximum number of iterations
NSP.Gmax = 100;
% Number of nurses
NSP.nurses = 10;
% Number of periods
NSP.periods = 21;
% Number of nurses required by period
NSP.N = repmat([1],1,NSP.periods);
% Minimal number of periods to work by nurses
NSP.Tmin = repmat([1],1,NSP.nurses);
% Maximal number of periods to work by nurses
NSP.Tmax = repmat([2],1,NSP.nurses);


% Launching Tabu Search
disp(TabuSearch(NSP));