function [bool] = conditionsFulfilled(NSP,S)
bool = true;
% Column constraint are always fulfilled, only line constraints have to be
% checked
% Line constraints
for i=1:1:size(S,1)
    % Tmin, Tmax
    if sum(S(i,:)) < NSP.Tmin(i) || sum(S(i,:)) > NSP.Tmax(i)
        bool = false;
        return;
    end
    % 2 free periods
    for j=1:1:size(S,2)-2
        if S(i,j) + S(i,j+1) + S(i,j+2) > 2
            bool = false;
            return;
        end
    end
end
end