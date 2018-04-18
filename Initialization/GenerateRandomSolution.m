function S = GenerateRandomSolution(NSP)
S = zeros(NSP.nurses,NSP.periods);
for j=1:1:NSP.periods
    % Randomly select the nurses going to work the period j
    r = randperm(NSP.nurses,NSP.N(j));
    Scol = S(:,j);
    Scol(r) = 1;
    S(:,j) = Scol;
end
end

