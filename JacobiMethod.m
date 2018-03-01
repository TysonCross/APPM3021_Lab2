function [x,iterationCount] = jacobiMethod(A,b,x_0,tol)
% JacobiMethod uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance using
% the Jaconbi method

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

x = x_0;

% check convergence
if ~converges(A)
    disp('The matrix does not converge')
    iterationCount = 0;
    return
end

[L, D, U] = LDU(A);
correct_solution = A\b;

iterationCount = 1;
while true
    y=b-(L+U)*x(:,iterationCount);
    x(:,iterationCount+1)=D\y;
    err_norm = sum(abs(correct_solution - x(:,iterationCount+1)));
    if err_norm <= tol
        break;
    end
    if isnan(err_norm)
        error(['Solution at index(',num2str(iterationCount),' has NaN entry'])
    end
        if isinf(err_norm)
        error(['Solution at index(',num2str(iterationCount),' has Inf entry'])
    end
    iterationCount=iterationCount+1;
end

end