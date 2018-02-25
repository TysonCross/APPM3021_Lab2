function x = isSolvable( A )
% Checks if input matrix is square and non-singular

x = true;
n = size(A);
if n(1) ~= n(2)
    disp('Matrix is not square')
    x = false;
    return
end

if det(A)==0
    disp('Matrix is singular')
    x = false;
    return
end

end

