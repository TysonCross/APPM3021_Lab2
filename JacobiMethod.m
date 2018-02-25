function [x,i] = JacobiMethod(A,b,x_0,tol)
% JacobiMethod uses an iterative technique to estimate the solution
% to a given system of equations within a specified tolerance

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    err(strcat('Matrix is not solvable'))
end

L = tril(A,-1);
U = triu(A,1);
D = A-L-U;
x = x_0;

check = A\b

i = 1;
while true
    y=b-(L+U)*x(:,i)
    x(:,i+1)=D\y
    err_norm = sum(abs(check-x(:,i+1)));
    if err_norm <= tol || isnan(err_norm) || isinf(err_norm)
        break;
    end
    i=i+1;
end


% i = 1;
% while true
%     for j = 1:n                                     % each row
%         for k = 1:n                                 % each entry in the row
%             sum = 0;
%             if ~(k==j)                          % avoid the entry we are solving for
%             sum = sum + A(j,k)*x(j,i);          % calculate the entry
%             end
%         end
%         x(j,i+1) = (b(j)-sum) / A(j,j);
%     end
%     disp(['Iteration: ',num2str(i-1)])
%     disp('x(k) = ')
%     disp(x(:,i))
%     disp('x(k+1) = ')
%     disp(x(:,i+1))
%     err = abs(x(:,i+1) - x(:,i))
%     err_norm = sum(err)
%     disp(['max difference is = ',num2str(err_norm)])
%     if err_norm <= tol 
%         i = i -1;
%         break;
%     end
%     i = i+1;
% end
% 
% disp('Solution iterations:')
% disp(x)

end

