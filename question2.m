% APPM3021 Lab 2, Question 2a

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


