% Check wether a matrix X is legal : if the column contraints are fuldilled
function [bool] = isLegal(NSP,X)
bool = true;
for j=1:1:size(X,2)
    if sum(X(:,j)) < NSP.N(j)
        bool = false;
        return;
    end
end
end
