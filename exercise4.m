% APPM3021 Lab 3, Exercise 4

clc
clear all
digits(32)
% dbstop if error

n = 100;
tol = 0.000001;

%% Generate
A = generateDiagonallyDominantMatrix(n);
b = randi(10,n,1);
x_0 = zeros(n,1);


%% Measure
[sol_jac, iter_jac] = jacobiMethod(A,b,x_0,tol);
[sol_gss, iter_gss] = gaussSeidel(A,b,x_0,tol);
[sol_sor, iter_sor] = SOR(A,b,x_0,tol);

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
xlim(ax1,[2 iter_jac(1,1)]);
box(ax1,'off');
set(ax1,'FontSize',14,...
    'XTick',[0:5:iter_jac(1,1)],...
    'XTickLabelRotation',45,...
    'YMinorTick','on','YScale','log');hold on

% Legend
legend1 = legend({'Jacobi','Gauss-Seidel','SOR','Convergence tolerance'},...
     'Position',[0.7    0.7    0.2    0.09],...
     'Box','off');
hold off
% export (fix for missing CMU fonts in eps export)
% export_fig relative_error.eps
epswrite('relative_error.eps');
% epsembedfont('relative_error.eps','+CMU Serif=>mwa_cmr10')


