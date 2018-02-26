clc
clear all
digits(32)

n = 50;
tol = 0.0001

%% Generate
Cell_of_Matrices{1}=n;
for iter = 2:n
    M = generateDiagonallyDominantMatrix(iter);
    v = randi(10,iter,1);
    Cell_of_Matrices(iter)={M};
    Cell_of_Values(iter)={v};
end

iter_jac = zeros(n,1);
iter_gs = zeros(n,1);
iter_SOR = zeros(n,1);
error_jac = zeros(n,1);
error_gs = zeros(n,1);
error_SOR = zeros(n,1);

%% Measure
for iter=2:n
    index = iter-1;
    A = cell2mat(Cell_of_Matrices(1,iter));
    b = cell2mat(Cell_of_Values(1,iter));
    x_0 = zeros(iter,1);

    [sol_jac, iter_jac(iter)] = JacobiMethod(A,b,x_0,tol);
    [sol_gs, iter_gs(iter)] = gaussSeidel(A,b,x_0,tol);
    [sol_SOR, iter_SOR(iter)] = SOR(A,b,x_0,tol);

    error_jac(iter)   = max( abs(sol_jac(end) - sol_jac(end-1)) )/...
                  max( abs(sol_jac(end)) );
              
    error_gs(iter)    = max(abs(sol_gs(end) - sol_gs(end-1)))/...
                  max(abs(sol_gs(end)));
              
    error_SOR(iter)   = max(abs(sol_SOR(end) - sol_SOR(end-1)))/...
                  max(abs(sol_SOR(end)));
end

% p1_1 = plot(iter_jac);
% hold on
% p2_1 = plot(iter_gs);
% hold on
% p3_1 = plot(iter_SOR);
% hold on

p1_2 = plot(error_jac);
hold on
p2_2 = plot(error_gs);
hold on
p3_2 = plot(error_SOR);
hold on