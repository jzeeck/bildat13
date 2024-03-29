function pixels = Lvvvtilde( inpic, shape )
if (nargin < 2)
    shape = 'same';
end

dxmask = ...
    [0 0    0 0   0
     0 0    0 0   0
     0 -0.5 0 0.5 0
     0 0    0 0   0
     0 0    0 0   0];
 
dymask = ...
    [0 0 0    0 0
     0 0 -0.5  0 0
     0 0 0    0 0
     0 0 0.5 0 0
     0 0 0    0 0];
 
 
dxxmask = ...
    [0 0 0  0 0
     0 0 0  0 0
     0 1 -2 1 0
     0 0 0  0 0
     0 0 0  0 0];
 
dyymask = ...
    [0 0 0  0 0
     0 0 1  0 0
     0 0 -2 0 0
     0 0 1  0 0
     0 0 0  0 0];
fprintf('Init the masks\n')
 
dxxxmask = conv2(dxmask,dxxmask);
dxxxmask = dxxxmask(3:7, 3:7);

dxxymask = conv2(dxxmask,dymask);
dxxymask = dxxymask(3:7, 3:7);

dxyymask = conv2(dxmask,dyymask);
dxyymask = dxyymask(3:7, 3:7);

dyyymask = conv2(dymask,dyymask);
dyyymask = dyyymask(3:7, 3:7);
fprintf('Created additional masks with conv2\n')

Lx = filter2(dxmask, inpic, shape);
Lxxx = filter2(dxxxmask, inpic, shape);

Ly = filter2(dymask, inpic, shape);
Lyyy = filter2(dyyymask, inpic, shape);

Lxxy = filter2(dxxymask, inpic, shape);
Lxyy = filter2(dxyymask, inpic, shape);
fprintf('Created the derivitives neededs\n')

pixels = Lx.^3.*Lxxx + 3*Lx.^2.*Ly.*Lxxy + 3*Ly.^2.*Lx.*Lxyy + Ly.^3.*Lyyy;
fprintf('Finished calculating\n')

end

