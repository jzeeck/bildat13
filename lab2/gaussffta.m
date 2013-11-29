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

[X,Y] = meshgrid(linspace(-xmax/2,xmax/2,xmax),linspace(-ymax/2,ymax/2,ymax));
g =  (1/2*pi*t) * exp((-X.^2 - Y.^2)/(t*2));   

Fhat = fft2(pic);
Ghat = fft2(fftshift(g));
results = ifft2(Fhat.*Ghat);


end

