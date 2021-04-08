function[mesh] = cylMeshGen(R, H, L_f, L_w, theta, layers, dx, dy)
% generate a blockMeshDict file for openFoam


%% SURFACE VERTICES

n = 2*pi/theta;
m = layers;
surface = zeros(n*m,3);
id = 0;

for i =1:m+1
    r = 1+R*(i-1)/m;
    if m == 0
       r = 1; 
    end
    
    for j=1:n
        id = id + 1;
        surface(id,1) = r*cos((j-1)*theta); % x
        surface(id,2) = r*sin((j-1)*theta); % y
        surface(id,3) = id; % id
    end
end

%% PROJECTED VERTICES

corners = zeros(4, 2);
id = 0;
n_xw = L_w / dx;
n_xf = L_f / dx;
n_y = H / dy;
proj = zeros(2000, 3);
fake_n = n_xw*(1+n/8);

for i=1:n
    if 1 <= i && i < (1+n/8)                                               % DONE
        %back
        for j = 1:n_xw
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) + j*(L_w - (1+R)*surface(i,1))/n_xw;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end
    elseif i == (1+n/8)                                                    % DONE
        %back/top
        for j = 1:n_xw
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) + j*(L_w - (1+R)*surface(i,1))/n_xw;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end        
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end        
        corners(1,1) = (1+R)*surface(i,1) + (L_w - (1+R)*surface(i,1))/n_xw;
        corners(1,2) = (1+R)*surface(i,2) + (H - (1+R)*surface(i,2))/n_y;
     elseif (1+n/8) < i && i < (1+3*n/8)                                   % DONE
        %top
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end      
      elseif i == (1+3*n/8)                                                % DONE
        %top
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end      
        %front
        for j = 1:n_xf
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) - j*(L_f + (1+R)*surface(i,1))/n_xf;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end
        corners(2,1) = (1+R)*surface(i,1) - (L_f + (1+R)*surface(i,1))/n_xf;
        corners(2,2) = (1+R)*surface(i,2) + (H - (1+R)*surface(i,2))/n_y;
        elseif (1+3*n/8) < i && i < (1+5*n/8)                                 % DONE
        %front        
        for j = 1:n_xf
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) - j*(L_f + (1+R)*surface(i,1))/n_xf;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end        
        
   elseif i == (1+5*n/8)                                                   % DONE
        %front
        for j = 1:n_xf
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) - j*(L_f + (1+R)*surface(i,1))/n_xf;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end
        %bot
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(-H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end      
        corners(3,1) = (1+R)*surface(i,1) - (L_f + (1+R)*surface(i,1))/n_xf;
        corners(3,2) = (1+R)*surface(i,2) + (-H - (1+R)*surface(i,2))/n_y;
    elseif (1+5*n/8) < i && i < (1+7*n/8)                                  % DONE
        %bot
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(-H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end      
   elseif i == (1+7*n/8)                                                   % DONE
        %bot
        for j = 1:n_y
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1);
            proj(id,2) = (1+R)*surface(i,2) + j*(-H - (1+R)*surface(i,2))/n_y;
            proj(id,3) = id;
        end      
        %back
        for j = 1:n_xw
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) + j*(L_w - (1+R)*surface(i,1))/n_xw;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end
        corners(4,1) = (1+R)*surface(i,1) + (L_w - (1+R)*surface(i,1))/n_xw;
        corners(4,2) = (1+R)*surface(i,2) + (-H - (1+R)*surface(i,2))/n_y;
    elseif (1+7*n/8) < i && (i <= n)                                       % DONE
        %back
        for j = 1:n_xw
            id = id+1;
            proj(id,1) = (1+R)*surface(i,1) + j*(L_w - (1+R)*surface(i,1))/n_xw;
            proj(id,2) = (1+R)*surface(i,2);
            proj(id,3) = id;
        end
    end
end

%% QUADRANT VERTICES
quadrant = zeros(n_xf,3);
x1 = linspace(-L_f,corners(2,1),n_xf);
x2 = linspace(corners(1,1),L_w,n_xw);
y1 = linspace(-H,corners(3,2),n_y);
y2 = linspace(corners(1,2),H,n_y);
x = [x1 x2];
y = [y1 y2];
id = 0;
for i=1:2*n_y
    for j=1:(n_xf+n_xw)
        id = id+1;
        quadrant(id,1) = x(j);
        quadrant(id,2) = y(i);
        quadrant(id,3) = id;
    end
end

%% INTO LIST
N = length(surface)+length(proj)+length(quadrant);
mesh = zeros(N, 3);

mesh(1:length(surface),1) = surface(:,1);
mesh(1:length(surface),2) = surface(:,2);
mesh((length(surface)+1):(length(surface)+length(proj)),1) = proj(:,1);
mesh((length(surface)+1):(length(surface)+length(proj)),2) = proj(:,2);
mesh((length(surface)+length(proj)+1):N,1) = quadrant(:,1);
mesh((length(surface)+length(proj)+1):N,2) = quadrant(:,2);
mesh = round(mesh, 5);

for i=1:N
    mesh(i,3) = i;
end