clc;
clear all;
close all;

q = [9,17,17,5,125,64,65];
p = [5,9,121,1,1,64,65];

for i = 1:length(p)
  sprintf('Indata: (p, q) = (%d, %d)', p(i), q(i))
  figure();
  fftwave(p(i), q(i));
end