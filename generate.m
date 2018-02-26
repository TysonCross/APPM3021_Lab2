% Generate Matrices

clc
clear all

%% Write
% serial = regexprep(num2str(now), '[.-/]', '')
% filename = strcat('measurements.',serial,'.txt');
% dlmwrite(filename,'')

n=10;
Cell_of_Matrices{1}=n;
% dlmwrite(filename,n,'-append')
for iter = 2:n
    M = rand(iter);
    v = randi(10,iter,1);
    Cell_of_Matrices(iter)={M};
    Cell_of_Values(iter)={v};
%     dlmwrite(filename',M,'-append')
end
% 
% for iter=2:n
%     disp(['(',num2str(iter),',',num2str(iter),'):'])
%     index = iter-1;
%     A = cell2mat(Cell_of_Matrices(1,iter));
%     b = cell2mat(Cell_of_Values(1,iter));
%     x_0 = zeros(iter,1);
% 
%     [sol_jac, iter_jac(index)] = JacobiMethod(A,b,x_0,tol);
%     [sol_gs, iter_gs(index)] = gaussSeidel(A,b,x_0,tol);
%     [sol_SOR, iter_SOR(index)] = SOR(A,b,x_0,tol);
% 
%     error_jac = max( abs(sol_jac(end) - sol_jacobi(end-1)) )/...
%                 max( abs(sol_jac(end)) );
%     error_gs = max(abs(sol_gs(end) - sol_gs(end-1)))/ max(abs(sol_gs(end)));
%     error_SOR = max(abs(sol_SOR(end) - sol_SOR(end-1)))/ max(abs(sol_SOR(end)));
% end


