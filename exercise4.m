% APPM3021 Lab 2, Exercise 4

clc
clear all
digits(32)
% dbstop if error

tol = 0.000001;

%% Generate
n = 100;
% A = generateDiagonallyDominantMatrix(n);
% dlmwrite('Data/matrix.txt',A,'precision',3);
% matrix2latexmatrix(A,'Data/matrix_values.tex');
A = dlmread('Data/matrix.txt');
b = randi(10,n,1);
x_0 = zeros(n,1);

%% Measure
tic
[sol_jac, iter_jac] = jacobi(A,b,x_0,tol);
time_jac = toc; tic;
[sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
time_gss = toc; tic;
[sol_sor, iter_sor] = SOR(A,b,x_0,tol);
time_sor = toc;

%% Relative Errors
error_jac = zeros(iter_jac,1);
error_gss = zeros(iter_gss,1);
error_sor = zeros(iter_sor,1);


for index=2:iter_jac+1
    difference = abs(sol_jac(:,index) - sol_jac(:,index-1));
    error_jac(index) = max(difference)/max(abs(sol_jac(:,index)));
end
for index=2:iter_gss+1
    difference = abs(sol_gss(:,index) - sol_gss(:,index-1));
    error_gss(index) = max(difference)/max(abs(sol_gss(:,index)));
end
for index=2:iter_sor+1
    difference = abs(sol_sor(:,index) - sol_sor(:,index-1));
    error_sor(index) = max(difference)/max(abs(sol_sor(:,index)));
end
    
% remove the empty first entry
error_jac(1) = [];
error_gss(1) = [];
error_sor(1) = [];

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
fig1 =  figure('Position',...                               % draw figure
    [1 scr(4)*3/5 scr(3)*3.5/5 scr(4)*3/5]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
    'name','Comparison of iterative matrix methods',...
    'Color','white');
set(fig1, 'MenuBar', 'none');                             % Make figure clean
set(fig1, 'ToolBar', 'none');                             
% fontName='CMU Serif';
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')      

%% Plot
p1 = semilogy(error_jac,...
        'Color',[0.18 0.18 0.9 .6],...                 
        'LineStyle','-',...
        'LineWidth',1);
hold on
p2 = semilogy(error_gss,...
        'Color',[0.18 0.9 0.18 .6],...                 
        'LineStyle','-',...
        'LineWidth',1);
hold on
p3 = semilogy(error_sor,...
        'Color',[0.9 0.18 0.18 .6],...                 
        'LineStyle','-',...
        'LineWidth',1);
hold on
% p4 = refline(0,tol);
% set(p4,'Color',[0.18 0.18 0.18 .6],...                 
%         'LineStyle',':',...
%         'LineWidth',1);
% hold on

% Title
title('Relative Error vs. Iterations',...
    'FontSize',14,...
    'FontName',fontName);

% Axes and labels
ax1 = gca;
% hold(ax1,'on');
ylabel('Relative Error',...
    'FontName',fontName,...
    'FontSize',14);%,...
xlabel('Number of Iterations',...
    'FontName',fontName,...
    'FontSize',14);
xlim(ax1,[1 iter_jac(1,1)]);
box(ax1,'off');
set(ax1,'FontSize',14,...
    'XTick',[0:5:iter_jac(1,1)],...
    'XTickLabelRotation',45,...
    'YMinorTick','on');hold on

% Legend
legend1 = legend({'Jacobi','Gauss-Seidel','SOR'},...
     'Position',[0.7    0.7    0.2    0.09],...
     'Box','off');
hold off
% epswrite('images/relative_error.eps');
