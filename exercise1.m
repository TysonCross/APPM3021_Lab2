% APPM3021 Lab 2, Exercise 1

clc
clear all

% Input system of equations
rows = 8;
A = generateDiagonallyDominantMatrix(rows)
b = randi(10,rows,1)

% Iteration parameters
x_0 = zeros(length(b),1);
tol = 0.00001

% Iterative attempt at solution
tic;
[sol_jac, iter_jac] = jacobi(A,b,x_0,tol);
time_jac = toc;
correct_solution = A\b;

% Display results
displaySolution(sol_jac, iter_jac, tol, correct_solution, time_jac, 2)