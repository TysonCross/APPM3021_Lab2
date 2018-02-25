function [x,i] = JacobiMethod(A,b,x_0,tol)
% JacobiMethod uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance using
% the Jaconbi method

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    err(strcat('Matrix is not solvable'))
end

[L, D, U] = LDU(A)
x = x_0;

check = A\b;

i = 1;
while true
    y=b-(L+U)*x(:,i);
    x(:,i+1)=D\y;
    err_norm = sum(abs(check-x(:,i+1)));
    if err_norm <= tol || isnan(err_norm) || isinf(err_norm)
        break;
    end
    i=i+1;
end

end