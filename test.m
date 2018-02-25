clc 
clear all

% rows = 3;
% A = magic(rows)
% b = randi(10,rows,1)

A = [ 3, 1, -1;...
      1, -4, 2;...
      -2, -1, 5]
b = [3;-1;2]
L = tril(A,-1)
U = triu(A,1)
D = A-L-U
n = length(b);
x = zeros(n,1);
tol = 0.0001;

check = A\b

i = 1;
while true
% N= 3;
% for i=1:N
    y=b-(L+U)*x(:,i)
    x(:,i+1)=D\y
    
    err = abs(check - x(:,i+1));
    err_norm = sum(err);
    if err_norm <= tol || isnan(err_norm) || isinf(err_norm)
        break;
    end
    i=i+1;
end

disp(['max difference is = ',num2str(err_norm)])
disp(['Solution converged within tolerance, in ', num2str(i),' iterations'])