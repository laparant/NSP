% Swap the elements i and k from column j
function X = swap(X,j,i,k)
e1 = (j-1)*size(X,1)+i;
e2 = (j-1)*size(X,1)+k;
X([e1 e2]) = X([e2 e1]);
end