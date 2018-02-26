clc
clear all

n = 100;
tol = 0.0001;

%% Generate
Cell_of_Matrices{1}=n;
for iter = 2:n
    M = randi(iter,iter);
while (det(M)==0)
    M = rand(iter,iter);
end
    v = randi(10,iter,1);
    Cell_of_Matrices(iter)={M};
    Cell_of_Values(iter)={v};
end

%% Measure
for iter=2:n
    disp(['(',num2str(iter),',',num2str(iter),'):'])
    index = iter-1;
    A = cell2mat(Cell_of_Matrices(1,iter));
    b = cell2mat(Cell_of_Values(1,iter));
    x_0 = zeros(iter,1);

    [sol_jac, iter_jac] = JacobiMethod(A,b,x_0,tol)
    [sol_gs, iter_gs] = gaussSeidel(A,b,x_0,tol);
    [sol_SOR, iter_SOR] = SOR(A,b,x_0,tol);

    error_jac   = max( abs(sol_jac(end) - sol_jac(end-1)) )/...
                  max( abs(sol_jac(end)) )
              
    error_gs    = max(abs(sol_gs(end) - sol_gs(end-1)))/...
                  max(abs(sol_gs(end)));
              
    error_SOR   = max(abs(sol_SOR(end) - sol_SOR(end-1)))/...
                  max(abs(sol_SOR(end)));
end

