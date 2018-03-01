% APPM3021 Lab 2, Question 1a

clc
clear all

% Input system of equations
A = [ 2,   1,  -1,  2;...
      4,   5,  -3,  6;...
     -2,   5,  -2,  6;...
      4,  11,  -4,  8]
 b = [5; 9; 4; 2]

% Iteration parameters
x_0 = zeros(length(b),1);
tol = 0.00001

% Iterative attempt at solution
if ~isSolvable(A)
    return
elseif ~converges(A)
    return
else
    [sol_jac, iter_jac] = jacobiMethod(A,b,x_0,tol);
    [sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
    [sol_sor, iter_sor] = SOR(A,b,x_0,tol);
end

% Display results
correct_solution = A\b;
displaySolution(sol_jac, iter_jac, tol, correct_solution, 'Jacobi')
displaySolution(sol_gss, iter_gss, tol, correct_solution, 'Gauss-Seidel')
displaySolution(sol_sor, iter_sor, tol, correct_solution, 'SOR')