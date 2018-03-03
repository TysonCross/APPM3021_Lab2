function [ L, D, U ] = LDU( A )
% LDU splits a given Matrix into 
% L = strictly lower triangular matrix of A
% D = a matrix of only the diagononal entries of A
% U = strictly upper triangular matrix of A

L = tril(A,-1);
U = triu(A,1);
D = A-L-U;

end