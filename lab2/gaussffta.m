function results = gaussffta(pic, t)
%GAUSSFFTA convolves the image pic with a two-dimensional
%Gaus- sian function of arbitrary variance t via a
%discretization of the Gaussian function in the spatial domain.
if (nargin < 1)
    error('Requires at least two input arguments.')
end
if (nargin == 1)
    t = 10;
end



[xmax, ymax] = size(pic);
g = zeros(xmax, ymax);
 
for x = 1:xmax
	for y = 1:ymax
        g(x,y) = (1/2*pi*t) * exp(-(x*x+y*y)/(2*t));
	end
end
results = conv2(pic,g);


end

