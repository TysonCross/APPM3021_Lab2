function [x,iterationCount] = SOR(A,b,x_0,tol)
% SOR uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance using
% the Successive Over-relaxation (SOR) method

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    err(strcat('Matrix is not solvable'))
end

[L, D, U] = LDU(A);
x = x_0;

correct_solution = A\b;
B = D\(L+U);
eigenvalue = max(abs(eig(B)));
omega = 2/(1+sqrt(1-eigenvalue^2));

iterationCount = 1;
while true
    y = omega*b + ((1-omega)*D - omega*U)*x(:,iterationCount);
    x(:,iterationCount+1) = (D+omega*L)\y;
    err = sum(abs(correct_solution - x(:,iterationCount+1)));
    if err <= tol
        break;
    end
    if isnan(err)
        error(['Entry at index(',num2str(iterationCount),') has NaN entry'])
    end
    if isinf(err)
        error(['Entry at index(',num2str(iterationCount),') has Inf entry'])
    end
    iterationCount=iterationCount+1;
end

end
