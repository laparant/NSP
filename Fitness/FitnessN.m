function [ values ] = FitnessN( NSP, N )
values = [];
% For each matrix in the list N, calculate its fitness value
for i=1:1:size(N,3)
    values = [values Fitness(NSP, N(:,:,i))];
end
end

