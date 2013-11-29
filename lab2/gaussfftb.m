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

[X,Y] = meshgrid(linspace(-pi,pi,xmax),linspace(-pi,pi,ymax));
Ghat = exp((-X.^2 - Y.^2)*t/2);                                        

Fhat = fft2(pic);

results = ifft2(Fhat.*Ghat);
end

