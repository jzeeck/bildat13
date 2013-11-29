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

for i = 1:length(T)
    psf = discgaussfft(deltafcn(128,128), T(i));
    variance(psf)
end

T = [1.0, 4.0, 16.0, 64.0, 256.0, 0];

figure;
for i = 1:length(T)
    pixels = discgaussfft(nallo256, T(i));
    subplot(2,3,i);
    showgray(pixels)
end

figure;
for i = 1:length(T)
    pixels = discgaussfft(phonecalc512, T(i));
    subplot(2,3,i);
    showgray(pixels)
end