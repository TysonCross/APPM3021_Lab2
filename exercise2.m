% APPM3021 Lab 3, Exercise 2

clc
clear all

A = [ 3, 1, -1;...
      1, -4, 2;...
      -2, -1, 5];
  
b = [3;-1;2];

% rows = 5;
% A = magic(rows)
% b = randi(10,rows,1)

x_0 = zeros(length(b),1)
tol = 0.000001

[solution, iterations] = gaussSeidel(A,b,x_0,tol);

% Output and check
correct_solution = A\b;
if ~isequal(solution(length(solution)),correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution(length(solution))-correct_solution))))])
    disp(' ')
end

disp(['Solution converged within ', num2str(iterations), ' iterations'])
solution(:,length(solution))