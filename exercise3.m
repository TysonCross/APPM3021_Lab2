% APPM3021 Lab 3, Exercise 3

clc
clear all

A = [ 3, 1, -1;...
      1, -4, 2;...
      -2, -1, 5]
  
b = [3;-1;2]

% rows = 2;
% A = randi(rows,rows);
% while (det(A)==0)     % need to test for convergence
%     A = rand(rows,rows);
% end
% A
% b = randi(10,rows,1)

x_0 = zeros(length(b),1)
tol = 0.0001

[solution, iterations] = SOR(A,b,x_0,tol);

% Output and check
correct_solution = A\b;
if ~isequal(solution(end),correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(abs(solution(end)-correct_solution)))])
    disp(' ')
end

relative_norm = max(abs(solution(end) - solution(end-1)))/ max(abs(solution(end)));
disp(['Solution has a norm of ', num2str(relative_norm)])
disp(['Solution converged within ', num2str(iterations), ' iterations'])
solution(:,length(solution))

