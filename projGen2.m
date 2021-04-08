function [vertices, blocks] = projGen2(L_f, L_w, H, R, n_x, n_xw, n_y, rad)

vertices = zeros(16,2);
blocks = zeros(12,6);
val = (.5+R)*cos(pi/4);
for i =[15:16, 1:3]
    vertices(i,1) = L_w;
end
for i =7:11 
    vertices(i,1) = -L_f;
end
for i =3:7
    vertices(i,2) = H;
end
for i =11:15
    vertices(i,2) = -H;
end

for i = [2 8]
    vertices(i,2) = val;
end
for i = [6 12]
    vertices(i,1) = -val;
end
for i = [10 16]
    vertices(i,2) = -val;
end
for i = [4 14]
    vertices(i,1) = val;
end

%% BLOCK

blocks(1,1) = 9;
blocks(1,2) = 17;
blocks(1,3) = 18;
blocks(1,4) = 10;

blocks(2,1) = 10;
blocks(2,2) = 18;
blocks(2,3) = 19;
blocks(2,4) = 20;

blocks(3,1) = 10;
blocks(3,2) = 20;
blocks(3,3) = 21;
blocks(3,4) = 11;

blocks(4,1) = 11;
blocks(4,2) = 21;
blocks(4,3) = 22;
blocks(4,4) = 12;

blocks(5,1) = 12;
blocks(5,2) = 22;
blocks(5,3) = 23;
blocks(5,4) = 24;

blocks(6,1) = 12;
blocks(6,2) = 24;
blocks(6,3) = 25;
blocks(6,4) = 13;

blocks(7,1) = 13;
blocks(7,2) = 25;
blocks(7,3) = 26;
blocks(7,4) = 14;

blocks(8,1) = 14;
blocks(8,2) = 26;
blocks(8,3) = 27;
blocks(8,4) = 28;

blocks(9,1) = 14;
blocks(9,2) = 28;
blocks(9,3) = 29;
blocks(9,4) = 15;

blocks(10,1) = 15;
blocks(10,2) = 29;
blocks(10,3) = 30;
blocks(10,4) = 16;

blocks(11,1) = 16;
blocks(11,2) = 30;
blocks(11,3) = 31;
blocks(11,4) = 32;

blocks(12,1) = 16;
blocks(12,2) = 32;
blocks(12,3) = 17;
blocks(12,4) = 9;

for i = [1 12]
    blocks(i,5) = n_xw; %gr1
    blocks(i,6) = rad; %gr2
end
for i = [6 7]
    blocks(i,5) = n_x; %gr1
    blocks(i,6) = rad; %gr2
end
for i = [3 4 9 10]
    blocks(i,5) = n_y; %gr1
    blocks(i,6) = rad; %gr2
end

blocks(2,5) = n_xw;
blocks(2,6) = n_y;

blocks(5,5) = n_y;
blocks(5,6) = n_x;

blocks(8,5) = n_x;
blocks(8,6) = n_y;

blocks(11,5) = n_y;
blocks(11,6) = n_xw;