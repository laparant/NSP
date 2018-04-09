function [bool] = IsLegal(P,S)
bool = true;
% Column constraint : N
for j=1:1:size(S,2)
    if sum(S(:,j)) < P.N(j)
        bool = false;
        return;
    end
end
% Line constraints : Tmin, Tmax, 2 périodes libres
for i=1:1:size(S,1)
    if sum(S(i,:)) < P.Tmin(i) || sum(S(i,:)) > P.Tmax(i)
        bool = false;
        return;
    end
    for j=1:1:size(S,2)-2
        if S(i,j) + S(i,j+1) + S(i,j+2) > 2
            bool = false;
            return;
        end
    end
end
end