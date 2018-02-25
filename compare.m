clc
clear all

A = [ 3, -1, 1;...
      1, 4, 1;...
      4, -1, 2];
  
b = [2;1;3];
x_0 = zeros(length(b),1);
tol = 0.00001;

[solution_jacobi, iterations_jacobi] = JacobiMethod(A,b,x_0,tol);
[solution_gaussSeidel, iterations_gaussSeidel] = gaussSeidel(A,b,x_0,tol);
[solution_SOR, iterations_SOR] = SOR(A,b,x_0,tol);

% indx_jacobi = min(find(sum(~isnan(solution_jacobi),1) > 0, 1, 'last'),...
%     find(sum(~isinf(solution_jacobi),1) > 0, 1, 'last'));
% 
% indx_gaussSeidel = min(find(sum(~isnan(solution_gaussSeidel),1) > 0, 1, 'last'),...
%     find(sum(~isinf(solution_gaussSeidel),1) > 0, 1, 'last'));
% 
% indx_SOR = min(find(sum(~isnan(solution_SOR),1) > 0, 1, 'last'),...
%     find(sum(~isinf(solution_SOR),1) > 0, 1, 'last'));


% Output and check
correct_solution = A\b
disp('______________________________________________________________________')
disp(' ')

disp(['Jacobi Solution converged within ', num2str(iterations_jacobi), ' iterations:'])
disp(solution_jacobi(:,end))
if ~isequal(solution_jacobi(:,end),correct_solution)
    warning(['Jacobi Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution_jacobi(:,end)-correct_solution))))])
    disp(' ')
end
disp('______________________________________________________________________')
disp(' ')

disp(['Gauss-Seidel Solution converged within ', num2str(iterations_gaussSeidel), ' iterations:'])
disp(solution_gaussSeidel(:,end))
if ~isequal(solution_gaussSeidel(:,end),correct_solution)
    warning(['Gauss-Seidel Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution_gaussSeidel(:,end)-correct_solution))))])
    disp(' ')
end
disp('______________________________________________________________________')
disp(' ')

disp(['SOR Solution converged within ', num2str(iterations_SOR), ' iterations:'])
disp(solution_SOR(:,end))
if ~isequal(solution_SOR(:,end),correct_solution)
    warning(['SOR Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution_SOR(:,end)-correct_solution))))])
    disp(' ')
end