function [ BestS,BestOV ] = GRASP( P,nIter)
    BestS = RandomSolve(P);
    BestOV = ObjectiveValue(P,BestS);
    for i=1:nIter
        S = RandomSolve(P);
        S = findNeighbor(P,S);
        if ObjectiveValue(P,S) < ObjectiveValue(P,BestS)
            BestS = S;
        end
        BestOV = [BestOV ObjectiveValue(P,BestS)];
    end
end