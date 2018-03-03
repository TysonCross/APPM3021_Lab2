% APPM3021 Lab 2, Question 2

clc
clear all

% Input system of equations
disp('Question 2')
disp(' ')

A = [ 4, -1,  0, -1,  0,  0,  0,  0,  0;...
     -1,  4, -1,  0, -1,  0,  0,  0,  0;...
      0, -1,  4,  0,  0, -1,  0,  0,  0;...
     -1,  0,  0,  4, -1,  0, -1,  0,  0;...
      0, -1,  0, -1,  4, -1,  0, -1,  0;...
      0,  0, -1,  0, -1,  4,  0,  0, -1;...
      0,  0,  0, -1,  0,  0,  4, -1,  0;...
      0,  0,  0,  0, -1,  0, -1,  4, -1;...
      0,  0,  0,  0,  0, -1,  0, -1,  4]
  disp(' ')

%% Question 2a)
disp('a)')
disp(' ')
if isDiagonallyDominant(A)
    disp('The matrix is diagonally dominant')
else
    disp('The matrix is not diagonally dominant')
end
disp(' ')
disp(' ')

%% Question 2b)
disp('b)')
disp(' ')
[L, D, U] = LDU(A);
B = -D\(L+U);
rho_j = max(abs(eig(B)));
rho_gs = rho_j^2;
disp('The spectral radii rho(B) of the Jacobi and Gauss-Seidel iteration matrices are as follows:')
disp(['rho_j  = ',num2str(rho_j)])
disp(['rho_gs = ',num2str(rho_gs) ])
disp(' ')
disp(' ')

%% Question 2c)
disp('c)')
disp(' ')
eigenvalue = max(abs(eig(B)));
omega = 2/(1+sqrt(1-eigenvalue^2));
disp(['The optimal value of the relaxation parameter omega is ', num2str(omega)]);
disp(' ')
disp(' ')

%% Question 2d)
disp('d)')
disp(' ')
rho_s = omega-1;
B_sor = (D+omega*L)\((1-omega)*D-omega*U);
rho_s2 = max(abs(eig(B_sor)));

disp(['The spectral radii rho(B) rho_s = omega - 1 = ', num2str(rho_s)]);
disp(['The spectral radii rho(B) of the SOR iteration matrix = max|lambda| = ', num2str(rho_s2)]);

if round(rho_s,4)==round(rho_s2,4)
    disp('(The values agree)')
else
    disp('(The values do NOT agree!)')
end
disp(' ')
disp(' ')

%% Question 2e)
disp('e)')
disp(' ')
n = length(A);
% setup the e_1 vector for the problem
e_1=zeros(n,1);
e_1(1,1)=1;
x_0 = zeros(n,1);
tol = 0.0001;

% Prediction
log_error = log(tol);
log_rho_j = log(rho_j);
log_rho_gs = log(rho_gs);
log_rho_s = log(rho_s);
i_j = log_error/log_rho_j;
i_gs = log_error/log_rho_gs;
i_s = log_error/log_rho_s;

disp('The predicted number of iterations is calculated for each method,')
disp(' using the spectral radii equations above, using the formula:')
disp(' ')
disp('    i <= log(error)/log(rho)')
disp(' ')
disp(['Using a tolerance/error threshold of ',num2str(tol),' for the predictions, then:'])
disp(' ')
disp(['i_j should be less than or equal to log(',...
    num2str(tol),')/log(',num2str(rho_j),') = ',...
    num2str(i_j), ' which is approximately ',...
    num2str(ceil(i_j))])
disp(['i_gs should be less than or equal to log(',...
    num2str(tol),')/log(',num2str(rho_gs),') = ',...
    num2str(i_gs), ' which is approximately ',...
    num2str(ceil(i_gs))])
disp(['i_s should be less than or equal to log(',...
    num2str(tol),')/log(',num2str(rho_s),') = ',...
    num2str(i_s), ' which is approximately ',...
    num2str(ceil(i_s))])
disp(' ')


%% Measure
disp('If the iterative solutions are computed from an initial zero vector then the results of each method are:')
disp(' ')
    tic
[sol_jac, iter_jac] = jacobi(A,e_1,x_0,tol);
    time_jac = toc; tic;
[sol_gss, iter_gss] = gaussSeidel(A,e_1,x_0,tol);
    time_gss = toc; tic;
[sol_sor, iter_sor] = SOR(A,e_1,x_0,tol);
    time_sor = toc;
    
% Display results
correct_solution = A\e_1;
disp(['Jacobi method converged in ', num2str(iter_jac),' iterations'])
disp(['Gauss-Seidel method converged in ', num2str(iter_gss),' iterations'])
disp(['SOR method converged in ', num2str(iter_sor),' iterations'])
disp(' ')
if iter_jac <= ceil(i_j)
disp('The predictions of the Jacobi method is within predicted bounds')
else disp('The predictions of the no. of iterations of Jacobi is larger than predected')
end

if iter_gss <= ceil(i_gs)
disp('The predictions of the Gauss-Seidel method is within predicted bounds')
else disp('The predictions of the no. of iterations of Gauss-Seidel is larger than predected')
end

if iter_sor <= ceil(i_s)
disp('The predictions of the SOR method is within predicted bounds')
else disp('The predictions of the no. of iterations of SOR is larger than predected')
end