% APPM3021 Lab 3, Exercise 4

clc
clear all
dbstop if error

number_of_matrices = 50;
tol = 0.0001

%% Generate
Cell_of_Matrices{1}=number_of_matrices;
for iter = 2:number_of_matrices
    M = generateDiagonallyDominantMatrix(iter);
    v = randi(10,iter,1);
    Cell_of_Matrices(iter)={M};
    Cell_of_Values(iter)={v};
end

% iter_jac = zeros(number_of_matrices,1);
% iter_gss = zeros(number_of_matrices,1);
% iter_sor = zeros(number_of_matrices,1);

%% Measure
for iter=2:number_of_matrices
%     index = iter-1;
    A = cell2mat(Cell_of_Matrices(1,iter));
    b = cell2mat(Cell_of_Values(1,iter));
    x_0 = zeros(iter,1);

    [sol_jac, iter_jac] = jacobiMethod(A,b,x_0,tol);
    [sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
    [sol_sor, iter_sor] = SOR(A,b,x_0,tol);

%     [~,size_jac] = size(sol_jac);
%     [~,size_gss] = size(sol_gss);
%     [~,size_sor] = size(sol_sor);

    error_jac = zeros(iter_jac,1);
    error_gss = zeros(iter_gss,1);
    error_sor = zeros(iter_sor,1);

    for index=2:iter_jac+1
        difference = abs(sol_jac(:,index) - sol_jac(:,index-1));
        error_jac(index) = max(difference)/max(abs(sol_jac(:,index)));
    end
    for index=2:iter_gss+1
        error_gss(index) = max(abs(sol_gss(:,index) - sol_gss(:,index-1)))/max(abs(sol_gss(:,index)));
    end
    for index=2:iter_sor+1
        error_sor(index) = max(abs(sol_sor(:,index) - sol_sor(:,index-1))) /max(abs(sol_sor(:,index)));
    end
    
    p1_1 = plot(1:iter_jac+1,error_jac);
    hold on
    p2_1 = plot(1:iter_gss+1,error_gss);
    hold on
    p3_1 = plot(1:iter_sor+1,error_sor);
    hold on

    return
end



