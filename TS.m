function [ BestS,BestOV ] = TS( P,nIter)
    % Tabu Search Parameters
    % Tabu Length : a swap will be prohibited for TL moves
    nbLines = size(P.X,1);
    TL=round(0.5*nbLines);
    
    % Initialization
    BestS = RandomSolve(P);
    BestOV = ObjectiveValue(P,BestS);
    % Initialize Tabu Counters
    TC=zeros(nbLines,nbLines);
    
    % Iterations until nIter
    for it=1:nIter
        S = RandomSolve(P);
        [S, swapi, swapj] = findNeighbor(P,S);
        
        % Update Tabu Counters
        for i=1:1:nbLines-1
            for j=i:1:nbLines
                if i == swapi && j == swapj
                    TC(i,i) = TL;
                else
                    TC(i,j) = max(TC(i,j)-1,0);
                end
            end
        end
        
        % Update Best Solution Ever Found
        if ObjectiveValue(P,S) < ObjectiveValue(P,BestS)
            BestS = S;
        end
        BestOV = [BestOV ObjectiveValue(P,BestS)];
    end
end