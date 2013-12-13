function pixels = Lvvtilde( inpic, shape )
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
     0 0 -0.5 0 0
     0 0 0    0 0
     0 0 0.5  0 0
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
 
dxymask = conv2(dxmask,dymask);
dxymask = dxymask(3:7, 3:7);
 
Lx = filter2(dxmask, inpic, shape);
Lxx = filter2(dxxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lyy = filter2(dyymask, inpic, shape);
Lxy = filter2(dxymask, inpic, shape);

pixels = Lx .^2 .* Lxx + 2 * Lx .* Ly .* Lxy + Ly .^2 .* Lyy;



end

