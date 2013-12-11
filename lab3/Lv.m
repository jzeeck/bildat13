function pixels = Lv( inpic, shape )
if (nargin < 2)
    shape = 'same';
end

pixels = discgaussfft(inpic, 1.2);

%dxmask = [-5 5;-5 5];
%dymask = [-5 -5;5 5];

dymask = [ 1  5  1 
      0  0  0
     -1 -5 -1 ];
 
dxmask = [ 1  0  -1 
      5  0  -5
     1 0 -1 ];
 

Lx  = filter2(dxmask, pixels, shape); 
Ly  = filter2(dymask, pixels, shape);

pixels = Lx.^2 + Ly.^2;

end

