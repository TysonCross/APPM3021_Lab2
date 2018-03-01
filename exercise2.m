% APPM3021 Lab 2, Exercise 2

clc
clear all

% Input system of equations
rows = 8;
A=generateDiagonallyDominantMatrix(rows)
b = randi(10,rows,1)

% Iteration parameters
x_0 = zeros(length(b),1);
tol = 0.00001

% Iterative attempt at solution
[solution, iterations] = gaussSeidel(A,b,x_0,tol);
correct_solution = A\b;

% Display results
displaySolution(solution, iterations, tol, correct_solution)