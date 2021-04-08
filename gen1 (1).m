clear
clc

%% VARIABLES 
% w.r.t. D=1

% governing dimensions
R = 0.5;
H = 5; % > 3
L_f = 5; % > 3
L_w = 15; % >3

% subdivisions
theta = pi/16;
layers = 2;
dx =.5;
dy =.5;

mesh = cylMeshGen(R, H, L_f, L_w, theta, layers, dx, dy);

%% WRITE

x = mesh(:,1);
y = mesh(:,2);
n = mesh(:,3);

fid = fopen('blockMeshDict', 'w');
spec1 = '(%2.10f, %2.10f, 0.00) //%1f \n';
spec2 = '(%2.10f, %2.10f, 0.01) //%1f \n';

fprintf(fid, spec1, x, y, n);
fclose(fid);

%% PLOT
%{
disp(length(mesh));
scatter(mesh(:,1), mesh(:,2), 'black', 'filled');
%}