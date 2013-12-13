close all;
clear all;
clc;

house = godthem256;
tools  = few256;

scale = [0.0001, 1.0, 4.0, 16.0, 64.0];

figure;
% subplot(1,2,1);
% pixels = Lv(house);
% showgray(pixels > 70);
% 
% subplot(1,2,2);
% 
% curves = njetedge(house, 4.0, 10);
% overlaycurves(house, curves)


for i = 1:length(scale)
    curves  = njetedge(house, scale(i),15);
    subplot(2, 3, i);
    overlaycurves(house, curves)
end
figure;
for i = 1:length(scale)
    curves  = njetedge(tools, scale(i),15);
    subplot(2, 3, i);
    overlaycurves(tools, curves)
end
