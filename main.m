clear
clc

%% VARIABLES
L_f = 5; % forewind distance
L_w = 10; % wake distance
H = 10; % boundary height

R = 0.7; % wake layer thickness
rad = 15; % angular mesh density
tan = 15; % radial mesh density

n_x = 15; % x-direction mesh density
n_xw = 80;
n_y = 30; % y-direction mesh density

z = .05; % arbitrary thickness

plot = false;

plotBlock = true;
plotVertex = false;

block = 0;
vertex = 0;

%% MESH GENERATION

[v_w,b_w,e_w] = wakeGen2(R, rad, tan);
[v_p, b_p] = projGen2(L_f, L_w, H, R, n_x, n_xw, n_y, rad);

bounds = [L_f, L_w, R, H, z];
v = [v_w ; v_p];
b = [b_w ; b_p];

writeBlockMesh(bounds, v, b, e_w);

%% PLOT

if plot == true    
    x = v(:,1);
    y = v(:,2);

    bl = block+1;
    ve = vertex+1;

    v1 = b(bl,1);
    v2 = b(bl,2);
    v3 = b(bl,3);
    v4 = b(bl,4);
    
    hold on
    scatter(x, y, 100, 'black', 'filled');
    if plotBlock == true
        scatter(x(v1), y(v1), 100, 'red', 'filled');
        scatter(x(v2), y(v2), 100, 'red', 'filled');
        scatter(x(v3), y(v3), 100, 'red', 'filled');
        scatter(x(v4), y(v4), 100, 'red', 'filled');
    end
    if plotVertex == true
        scatter(x(ve), y(ve), 100, 'blue');
    end
    hold off
end