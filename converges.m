function [ result ] = converges( A )
% Tests to see if a given iterative, coefficient matrix B will converge to a unique solution
% Where Ax = Bx + c

result = false;
reason= ' ';
[L, D, U] = LDU(A);
B = -D\(L+U);

if matrixNorm(B) < 1
    result = true;
else
    reason = strcat(reason,', the norm ||B||_infinity is not less than 1 ');
end

rho = max(abs(eig(B)));
if rho < 1
    result = true;
else
    result = false;
    reason = strcat(reason,', the spectral radius rho(B) is not less than 1 ');
end

if ~result
    disp(['The matrix will not iteratively converge to unique solution',reason])
end
    
end
