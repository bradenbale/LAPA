% set(0, 'DefaultFigureWindowStyle', 'docked')

nx = 50;
ny = 50;
max = 1000;
V = zeros(nx, ny);

SidesToZero = 1;

for k = 1:max
    for i = 1:nx
        for j = 1:ny
            if (i == 1) && (j == 1) 
                V(i,j) = 1;
            elseif i == 1 
                V(i,j) = 1;
            elseif i == nx
                V(i,j) = SidesToZero;
            elseif j == 1
%                 V(i,j) = (V(i, j + 1) + V(i + 1, j) + V(i - 1, 1)) * 0.3333333333;
                V(i, j) = 0;
            elseif j == ny
                V(i,j) = (V(i, j - 1) + V(i + 1, j) + V(i - 1, j)) * 0.3333333333;
            else
                V(i, j) = (V(i, j + 1) + V(i, j - 1) + V(i + 1,j) + V(i - 1, j)) * 0.25;
            end    
            
        end
        
    end
        
    if mod(k,50) == 0
        surf(V)
        pause(0.1)
    end
end
V = imboxfilt(V);
[Ex, Ey] = gradient(V);

figure
quiver(-Ey', -Ex', 1)