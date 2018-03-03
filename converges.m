function [ result ] = converges( A )
% Tests to see if a given iterative, coefficient matrix B will converge to a unique solution
% Where Ax = Bx + c

result = false;
[L, D, U] = LDU(A);
B = -D\(L+U);
reason1 = '';
reason2 = '';

if matrixNorm(B) < 1
    result = true;
else
    reason1 = '  ·The norm ||B||_inf is not less than 1 ';
end

rho = max(abs(eig(B)));
if rho < 1
    result = true;
else
    result = false;
    reason2 = '  ·The spectral radius rho(B) is not less than 1 ';
end

if ~result
    disp('The matrix will not iteratively converge to unique solution:')
    disp(reason1)
    disp(reason2)
end
    
end
