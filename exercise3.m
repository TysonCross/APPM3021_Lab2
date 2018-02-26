% APPM3021 Lab 3, Exercise 3

clc
clear all

rows = 10;
A=generateDiagonallyDominantMatrix(rows)
b = randi(10,rows,1)

x_0 = zeros(length(b),1)
tol = 0.00001
round_error = abs(log10(tol))-1;

[solution, iterations] = SOR(A,b,x_0,tol);

% Output and check
solution(:,end)
correct_solution = A\b;
if isequal(round(solution(:,end),round_error),round(correct_solution,round_error))
    disp('Solution is correct')
else disp('Solution is incorrect:')
    correct_solution
end
if ~isequal(solution(:,end),correct_solution)
    disp(['Solution is inaccurate by a maximum difference of ',...
        num2str(max(abs(solution(:,end)-correct_solution)))])
end
relative_norm = max(abs(solution(:,end) - solution(:,end-1)))/ max(abs(solution(:,end)));
disp(['Solution has a norm of ', num2str(relative_norm)])
disp(['Solution converged within ', num2str(iterations), ' iterations'])

