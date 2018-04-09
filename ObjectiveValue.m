function [value] = ObjectiveValue(P,S)
value = 0;
for i=1:1:size(S,1)
    value = value + (sum(S(i,:)) - P.Tmin(i))*P.s;
    for j=1:1:size(S,2)
        value = value + P.C(i,j)*S(i,j);
    end
end
end