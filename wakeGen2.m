function[vertices, blocks, edges] = wakeGen2(R, rad, tan)

vertices = zeros(16,2);
blocks = ones(8,6);
edges = zeros(16,5);

ind = 1;
for j = 1:2
    r = .5 + (j-1)*R;
    for i=1:8
        vertices(ind,1) = r*cos(pi*(i-1)/4); % x
        vertices(ind,2) = r*sin(pi*(i-1)/4); % y
        ind=ind+1;
    end
end

ind = 1;
for i = 1:7
    blocks(ind,1) = i; % v1
    blocks(ind,2) = i+8; % v2
    blocks(ind,3) = i+9; % v3
    blocks(ind,4) = i+1; % v4
    ind=ind+1;
end

blocks(8,1) = 8;
blocks(8,2) = 16;
blocks(8,3) = 9;
blocks(8,4) = 1;
blocks(:,5) = tan;
blocks(:,6) = rad;

for i = 1:8
    edges(i,1) = i-1; %v1
    edges(i,2) = i; %v2
    edges(i,3) = .5*cos((1+2*(i-1))*pi/8);%x
    edges(i,4) = .5*sin((1+2*(i-1))*pi/8);%y
end
for i = 9:16
    edges(i,1) = i-1; %v1
    edges(i,2) = i; %v2
    edges(i,3) = (.5+R)*cos((1+2*(i-1))*pi/8);%x
    edges(i,4) = (.5+R)*sin((1+2*(i-1))*pi/8);%y
end

edges(8,1) = 7;
edges(8,2) = 0;
edges(16,1) = 15;
edges(16,2) = 8;