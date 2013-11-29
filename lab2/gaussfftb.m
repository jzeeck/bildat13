function results = gaussfftb(pic, t)
%GAUSSFFTB Summary of this function goes here
%   Detailed explanation goes here
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

Fhat = fftshift(fft2(pic));
% Ghat = fft2(g);
[X,Y] = meshgrid(1:xmax,1:ymax);
Ghat = fftshift(exp(-(X.^2 + Y.^2)*t/2));

results = ifft2(Fhat.*Ghat);
end

