%% Defining NSP (Nurse Scheduling Problem)

K = 4;

% Gmax : maximum number of iterations
NSP.Gmax = 100000;
% Number of nurses
NSP.nurses = 10*K;
% Number of periods
NSP.periods = 21;
% Number of nurses required by period
NSP.N=[repmat([3*K,2*K,1*K],1,5) repmat([4*K,3*K,1*K],1,2)];
% Minimal number of periods to work by nurses
NSP.Tmin = [repmat(2,1,2*K) repmat(4,1,8*K)];
% Maximal number of periods to work by nurses
NSP.Tmax = [repmat(3,1,2*K) repmat(7,1,8*K)];
% Tabu Length (needed for Tabu Search)
NSP.TabuLength = NSP.nurses * NSP.periods*0.5;

% Launching GRASP
T = zeros(100,1);
G = zeros(100,1);
for p=1:1:100
    [T(p), G(p)] = GRASP(NSP);
    disp(p);
end