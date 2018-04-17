function [ S ] = GreedyRandomSolve(P, S)
% If no choice for completing column condition, fill matrix
for j=1:1:size(S,2)
    Scolumn = S(:,j);
    if sum(abs(Scolumn)==1) == P.N(j)
        for i=1:1:size(S,1)
            if S(i,j) == -1
                S(i,j) = 1;
                if j-1 > 0
                    S(i,j-1) = 0;
                end
                if j-2 > 0
                    S(i,j-2) = 0;
                end
                if j+1 <= size(S,2)
                    S(i,j+1) = 0;
                end
                if j+2 <= size(S,2)
                    S(i,j+2) = 0;
                end
            end
        end
    end
end

% If no choice for completing line condition, fill matrix
for i=1:1:size(S,1)
    Sline = S(i,:);
    if sum(abs(Sline)==1) == P.Tmin(i)
        Sline(Sline==-1)=1;
        S(i,:) = Sline;
    end
end

% Complete solution
if ~ismember(-1,S)
    if ~IsLegal(P,S)
        S(1:size(P.X,1),1:size(P.X,2)) = -1;
    end
else
    
    % Randomly select next period to assign to which nurse
    r = datasample(find(S==-1),1);
    tmp = S;
    tmp(r) = 1;
    column=ceil(r/size(tmp,1));
    line = mod(r,size(tmp,1));
    if line == 0
        line = size(tmp,1);
    end
    
    % If Tmax is reached, fill line with 0
    if sum(tmp(line,:)) == P.Tmax(line)
        Tmpline = tmp(line,:);
        Tmpline(Tmpline == -1) = 0;
        tmp(line,:) = Tmpline;
    end
    
    % Fulfill the two free periods after one work period
    if column-1 > 0
        tmp(line,column-1) = 0;
    end
    if column-2 > 0
        tmp(line,column-2) = 0;
    end
    if column+1 <= size(tmp,2)
        tmp(line,column+1) = 0;
    end
    if column+2 <= size(tmp,2)
        tmp(line,column+2) = 0;
    end
    
    % Find Child solution
    res = GreedyRandomSolve(P,tmp);
    if ismember(-1,res)
        tmp = S;
        tmp(r) = 0;
        S = GreedyRandomSolve(P,tmp);
    else
        S = res;
    end
end
end