close all;
clear all;
clc;

house = godthem256;
tools  = few256;

figure;
scale = [0.0001, 1.0, 4.0, 16.0, 64.0];

for i = 1:length(scale)
    curves = zerocrosscurves(Lvvtilde(discgaussfft(house, scale(i)), 'same'), ...
    Lvvvtilde(discgaussfft(house, scale(i)), 'same'));
    subplot(2, 3, i);
    overlaycurves(house, curves)

end