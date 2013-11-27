clc;
close all;
clear all;
T = [0.1, 1.0, 10.0, 100.0];
for i = 1:length(T)
    psf = gaussffta(deltafcn(128,128), T(i));
    variance(psf)
end

for i = 1:length(T)
    psf = gaussfftb(deltafcn(128,128), T(i));
    variance(psf)
end