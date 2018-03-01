% APPM3021 Lab 2, Question 1b

clc
clear all

A = [ 3, 1, -1;...
     1, -4, 2;...
     -2, -1, 5]
 
 b = [3; -1; 2]

x_0 = zeros(length(b),1);
tol = 0.00001

if ~isSolvable(A)
    return
elseif ~converges(A)
    return
else
    [sol_jac, iter_jac] = jacobiMethod(A,b,x_0,tol);
    [sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
    [sol_sor, iter_sor] = SOR(A,b,x_0,tol);
end

correct_solution = A\b;

%% Output and check
displaySolution(sol_jac, iter_jac, tol, correct_solution, 'Jacobi')
displaySolution(sol_gss, iter_gss, tol, correct_solution, 'Gauss-Seidel')
displaySolution(sol_sor, iter_sor, tol, correct_solution, 'SOR')


