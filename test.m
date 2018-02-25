clc
clear all

A = [ 3, 1, -1;...
      1, -4, 2;...
      -2, -1, 5];
b = [3;-1;2];
x_0 = zeros(length(b),1);
tol = 0.000000000000001;

[solution_jacobi, iterations_jacobi] = JacobiMethod(A,b,x_0,tol);
[solution_gaussSeidel, iterations_gaussSeidel] = gaussSeidel(A,b,x_0,tol);


% Output and check
correct_solution = A\b;
if ~isequal(solution_jacobi(length(solution_jacobi)),correct_solution)
    warning(['Jacobi Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution_jacobi(length(solution_jacobi))-correct_solution))))])
    disp(' ')
end
if ~isequal(solution_jacobi(length(solution_jacobi)),correct_solution)
    warning(['Gauss-Seidel Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution_gaussSeidel(length(solution_gaussSeidel))-correct_solution))))])
    disp(' ')
end

disp(['Jacobi Solution converged within ', num2str(iterations_jacobi), ' iterations'])
solution_jacobi(:,length(solution_jacobi))

disp(['Gauss-Seidel Solution converged within ', num2str(iterations_gaussSeidel), ' iterations'])
solution_gaussSeidel(:,length(solution_gaussSeidel))