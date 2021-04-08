clc
clear all
close all
%VERTICIES

%Define Variables For BlockMesh

lf = 4; %fore
lw = 6; %wake
R = 1; %R (outer)?
h = 4; %top/bottom
d = 1;
r = d/2;

%need to ask in office hours
r = R -(d/2);

%generate verticies
%initializing verticies matrix
vertices = zeros(64,3);
%solving for points 0-15
pi_span = [0:pi/4:2*pi];
for x = [1:1:8]
    vertices(x,1) = (d/2)*cos(pi_span(x));
    vertices(x,2) = (d/2)*sin(pi_span(x));
    
    vertices(x+8,1) = ((d/2)+R)*cos(pi_span(x));
    vertices(x+8,2) = ((d/2)+R)*sin(pi_span(x));
    
end

%solving the rest of the points on the edge

%right edge 
vertices(17,1) = lw;
vertices(18,1) = lw;
vertices(19,1) = lw;
vertices(31,1) = lw;
vertices(32,1) = lw;

%top edge
for x = [19:1:23]
   vertices(x,2) = h; 
end

%bottom edge
for x = [27:1:31]
    vertices(x,2) = -h; 
end

%left edge
for x = [23:1:27]
    vertices(x,1) = -lf; 
end


vertices(18,2) = vertices(10,2);
vertices(20,1) = vertices(10,1);

vertices(22,1) = vertices(12,1);
vertices(24,2) = vertices(12,2);

vertices(26,2) = vertices(14,2);
vertices(28,1) = vertices(14,1);

vertices(30,1) = vertices(16,1);
vertices(32,2) = vertices(16,2);

%copying x & y values
vertices(33:64,:) = vertices(1:32,:);

%setting z values
vertices(1:32,3) = -5e-2;
vertices(33:64,3) = 5e-2;

for i=1:64
fprintf('( %0.6f  %0.6f  %0.6f) // %0.1i \n', vertices(i,1), vertices(i,2), vertices(i,3), i-1)
end
%%
%BLOCKS

%BL RESOLUTION
%BLOCKS 0-7
xsplit_BL=0;
ysplit_BL=0;
xgrade_BL=0;
ygrade_BL=0;
for i=0:6
    fprintf('hex (%0.1i %0.1i %0.1i %0.1i %0.1i %0.1i %0.1i %0.1i) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',i,i+8,i+9,i+1,i+32,i+40,i+41,i+33,10+xsplit_BL,20+ysplit_BL,2+xgrade_BL,1+ygrade_BL) 
end
fprintf('hex (7 15 8 0 39 47 40 32) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',10+xsplit_BL,20+ysplit_BL,1+xgrade_BL,1+ygrade_BL) 

%TRAILING EDGE RESOLUTION PART 1
%BLOCKS 8-9
xsplit_TE=0;
ysplit_TE=0;
xgrade_TE=0;
ygrade_TE=0;
fprintf('hex (8 16 17 9 40 48 49 41) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',30+xsplit_TE,20+ysplit_TE,4+xgrade_TE,1+ygrade_TE) 
fprintf('hex (9 17 18 19 41 49 50 51) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',30+xsplit_TE,30+ysplit_TE,4+xgrade_TE,4+ygrade_TE)

%TOP MIDDLE RESOLUTION
%BLOCKS 10-11
xsplit_TM=0;
ysplit_TM=0;
xgrade_TM=0;
ygrade_TM=0;
fprintf('hex (10 9 19 20 42 41 51 52) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',20+xsplit_TM,30+ysplit_TM,1+xgrade_TM,4+ygrade_TM)
fprintf('hex (11 10 20 21 43 42 52 53) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',20+xsplit_TM,30+ysplit_TM,1+xgrade_TM,4+ygrade_TM)

%LEADING EDGE RESOLUTION
%BLOCKS 12-15
xsplit_LE=0;
ysplit_LE=0;
xgrade_LE=0;
ygrade_LE=0;
fprintf('hex (23 11 21 22 55 43 53 54) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',15+xsplit_LE,30+ysplit_LE,0.25+xgrade_LE,4+ygrade_LE)
fprintf('hex (24 12 11 23 56 44 43 55) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',15+xsplit_LE,20+ysplit_LE,0.25+xgrade_LE,1+ygrade_LE)
fprintf('hex (25 13 12 24 57 45 44 56) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',15+xsplit_LE,20+ysplit_LE,0.25+xgrade_LE,1+ygrade_LE)
fprintf('hex (26 27 13 25 58 59 45 57) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',15+xsplit_LE,30+ysplit_LE,0.25+xgrade_LE,0.25+ygrade_LE)

%BOTTOM MIDDLE RESOLUTION
%BLOCKS 16-17
xsplit_BM=0;
ysplit_BM=0;
xgrade_BM=0;
ygrade_BM=0;
fprintf('hex (27 28 14 13 59 60 46 45) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',20+xsplit_BM,30+ysplit_BM,1+xgrade_BM,0.25+ygrade_BM)
fprintf('hex (28 29 15 14 60 61 47 46) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',20+xsplit_BM,30+ysplit_BM,1+xgrade_BM,0.25+ygrade_BM)

%TRAILING EDGE RESOLUTION PART 2
%BLOCKS 18-29
fprintf('hex (29 30 31 15 61 62 63 47) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',30+xsplit_TE,30+ysplit_TE,4+xgrade_TE,0.25+ygrade_TE)
fprintf('hex (15 31 16 8 47 63 48 40) (%0.1i %0.1i 1) simpleGrading ( %0.1i %0.1i 1.0) \n',30+xsplit_TE,20+ysplit_TE,4+xgrade_TE,1+ygrade_TE)

%%
%EDGES
%initialize midpoints
mid=zeros(32,3);
mid(:,3)=5.0e-2;

pi_span = [0:pi/8:2*pi];
even=(2:2:16);
pi_span=pi_span(even);
i=1;
for x = (1:4:32)
    mid(x,1) = (d/2)*cos(pi_span(i));
    mid(x,2) = (d/2)*sin(pi_span(i));
    mid(x,3)=-5.0e-2;
    
    mid(x+1,1) = ((d/2)+r)*cos(pi_span(i));
    mid(x+1,2) = ((d/2)+r)*sin(pi_span(i));
    mid(x+1,3)=-5.0e-2;
    
    mid(x+2,1) = mid(x,1);
    mid(x+2,2) = mid(x,2);
    
    mid(x+3,1) = mid(x+1,1);
    mid(x+3,2) = mid(x+1,2);
    i=i+1;
end

points=[0 1;
        8 9; 
        32 33;
        40 41;
        1 2; 
        9 10;
        33 34;
        41 42;
        2 3; 
        10 11;
        34 35;
        42 43;
        3 4; 
        11 12;
        35 36; 
        43 44;
        4 5; 
        12 13;
        36 37; 
        44 45;
        5 6;
        13 14;
        37 38;
        45 46; 
        6 7; 
        14 15;
        38 39;
        46 47;
        7 0;
        15 8;
        39 32;
        47 40];  
        
for i=1:32    
fprintf('arc %0.1i %0.1i ( %0.6f %0.6f %0.6f) \n',points(i,1),points(i,2),mid(i,1),mid(i,2),mid(i,3));
end

%% Faces

%Right face

