clc
clear all

% A = [ 3, 1, -1;...
%       1, -4, 2;...
%       -2, -1, 5];

% A = [ 1, 3, -5;...
%       8, -1, 10;...
%       -6, -5, 1];
%   
% b = matrixNorm(A);

n = 50;
A=generateDiagonallyDominantMatrix(n);
converges(A,'jac')
converges(A,'gss')
converges(A,'sor')

% b = [3;-1;2];
% x_0 = zeros(length(b),1);
% tol = 0.001;
% 
% [L, D, U] = LDU(A)
% x = x_0;
% 
% check = A\b;
% B = inv(D)*(L+U);
% eigenvalue = max(eig(B));
% omega = 2/(1+sqrt(1-eigenvalue^2));

% n =100;
% 
% A =generateDiagonallyDominantMatrix(n);

