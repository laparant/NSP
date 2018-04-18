% Find the neighborhood of the matrix X, fulfilling column constraints
function [N, Nmvt] = Neighborhood(NSP,X, TabuList)
% Initializing list of neighbors and moves associated
N = [];
Nmvt = cell(1,1);
n = 1;
% For each column, execute each legal swap
for j=1:1:size(X,2)
    for i=1:1:size(X,1)-1
        for k=i+1:1:size(X,1)
            % Generating only non tabu swap and not "useless" swap
            if TabuList(j,i,k) == 0 && X(i,j) ~= X(k,j)
                tmp = swap(X,j,i,k);
                % Adding neighbor if it's legal
                if isLegal(NSP,tmp)
                    N(:,:,n) = tmp;
                    Nmvt{n} = [j,i,k];
                    n = n + 1;
                end
            end
        end
    end
end
end

