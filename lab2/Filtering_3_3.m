clc
clear all;
cloase all;
t = [0.1, 1.0, 10.0 ,100.0];

for i = 1:length(t)
  psf = gaussfft(deltafcn(128, 128), t(i));
  variance(psf)
end