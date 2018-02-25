function [x,index] = JacobiMethod(A,b,x_0,tol)
% JacobiMethod uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance using
% the Jaconbi method

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    err(strcat('Matrix is not solvable'))
end

[L, D, U] = LDU(A);
x = x_0;

check = A\b;

index = 1;
while true
    y=b-(L+U)*x(:,index);
    x(:,index+1)=D\y;
    err_norm = sum(abs(check-x(:,index+1)));
    if err_norm <= tol
        break;
    end
    if isnan(err_norm)
        error(['Solution at index(',num2str(index),' has NaN entry'])
    end
        if isinf(err_norm)
        error(['Solution at index(',num2str(index),' has Inf entry'])
    end
    index=index+1;
end

end