function [ A ] = generateDiagonallyDominantMatrix( n)
% generateMatrix creates a single matrix of integers of size nxn
try_count=0;
rho=2;
redo=false;
A=[1,1;1,1];
while rho >= 1 || redo;
    try_count = try_count +1;
%     A=diag(randi([-10,10],n,1)*10) + randi(10,n,n) + ones(n,n);
    A = diag(randi([-10,10],n,1)*10)+gallery('lehmer',n);
    [L, D, U] = LDU(A);
    B = D\(L+U);
    if isSolvable(B)
        rho = max(abs(eig(B)));
    end
    if ~isSolvable(A) || ~isSolvable(B)
        redo=true;
    else redo=false;
    end
    if try_count > 1000
        error('Unable to generate convergent matrix')
    end
%     disp(['A solvable:',num2str(isSolvable(A)),' with rcond =r',num2str(rcond(A))])
%     disp(['B solvable:',num2str(isSolvable(B)),' with rcond =r',num2str(rcond(B))])
end
end



