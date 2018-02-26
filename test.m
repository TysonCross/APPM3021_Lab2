clc
clear all

% A = [ 3, 1, -1;...
%       1, -4, 2;...
%       -2, -1, 5];
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

n =100;

A =generateDiagonallyDominantMatrix(n);

