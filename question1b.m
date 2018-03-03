% APPM3021 Lab 2, Question 1b

clc
clear all

A = [ 3, 1, -1;...
     1, -4, 2;...
     -2, -1, 5]
 
 b = [3; -1; 2]

x_0 = zeros(length(b),1);
tol = 0.00001

if ~isSolvable(A)
    return
elseif ~converges(A)
    return
else
    tic;
    [sol_jac, iter_jac] = jacobi(A,b,x_0,tol);
    time_jac = toc; tic;
    [sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
    time_gss = toc; tic;
    [sol_sor, iter_sor] = SOR(A,b,x_0,tol);
    time_sor = toc; tic;
end

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

correct_solution = A\b;

%% Output and check
displaySolution(sol_jac, iter_jac, tol, correct_solution, time_jac, 1, 'Jacobi')
displaySolution(sol_gss, iter_gss, tol, correct_solution, time_gss, 1, 'Gauss-Seidel')
displaySolution(sol_sor, iter_sor, tol, correct_solution, time_sor, 1, 'SOR')

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
fig2 =  figure('Position',...                               % draw figure
    [1 scr(4)*3/5 scr(3)*3.5/5 scr(4)*3/5]);
set(fig2,'numbertitle','off',...                            % Give figure useful title
    'name','Comparison of iterative matrix methods',...
    'Color','white');
set(fig2, 'MenuBar', 'none');                             % Make figure clean
set(fig2, 'ToolBar', 'none');                             
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
p4 = refline(0,tol);
set(p4,'Color',[0.18 0.18 0.18 .6],...                 
        'LineStyle',':',...
        'LineWidth',1);
hold on

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
xlim(ax1,[1 iter_jac(1,1)+2]);
box(ax1,'off');
set(ax1,'FontSize',14,...
    'XTick',[0:1:iter_jac(1,1)+2],...
    'XTickLabelRotation',45,...
    'YMinorTick','on');hold on

% Legend
legend1 = legend({'Jacobi','Gauss-Seidel','SOR','Absolute error tolerance'},...
     'Position',[0.7    0.7    0.2    0.09],...
     'Box','off');
hold off
% epswrite('images/relative_error_1b.eps');