function [x,index] = SOR(A,b,x_0,tol)
% SOR uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance using
% the Successive Over-relaxation (SOR) method

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    err(strcat('Matrix is not solvable'))
end

[L, D, U] = LDU(A);
x = x_0;

check = A\b;
B = D\(L+U);
eigenvalue = max(abs(eig(B)));
omega = 2/(1+sqrt(1-eigenvalue^2));

index = 1;
while true
    y = omega*b + ((1-omega)*D - omega*U)*x(:,index);
    x(:,index+1) = (D+omega*L)\y;
    
    err = sum(abs(check-x(:,index+1)));
    if err <= tol
        break;
    end
    if isnan(err)
        error(['Solution at index(',num2str(index),' has NaN entry'])
    end
        if isinf(err)
        error(['Solution at index(',num2str(index),' has Inf entry'])
    end
    index=index+1;
end

end
