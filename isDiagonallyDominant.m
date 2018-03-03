function [ result ] = isDiagonallyDominant( A )
% Tests a matrix to see if it is diagnoally dominant

result = false;
[n,m] = size(A);

for i=1:n
    sum = 0;
    for j=1:m
        if i~=j
            sum = sum + A(i,j);
        end
    end
    if ~(abs(A(i,i)) > sum)
        result = false;
        return;
    else
        result = true;
    end
end

end