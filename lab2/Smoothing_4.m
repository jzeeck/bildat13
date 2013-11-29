clear all;
close all;
clc

office = office256;
add = gaussnoise(office, 16);
sap = sapnoise(office, 0.1, 255);
figure;
subplot(1,2,1);
showgray(add)
subplot(1,2,2);
showgray(sap)


T = [0.5, 1.0, 2.5, 4.0, 16.0];

figure;
index = 1;
for i = 1:length(T)
    
    pixels = discgaussfft(add, T(i));
    subplot(length(T),2,index);
    showgray(pixels)
    
    pixels = discgaussfft(sap, T(i));
    subplot(length(T),2,index+1);
    showgray(pixels)
    index = index+2;
end


T = [1, 2, 4, 8];

figure;
index = 1;
for i = 1:length(T)
    
    pixels = medfilt(add, T(i));
    subplot(length(T),2,index);
    showgray(pixels)
    
    pixels = medfilt(sap, T(i));
    subplot(length(T),2,index+1);
    showgray(pixels)
    index = index+2;
end



T = [0.1, 0.15, 0.2, 0.4, 0.8];

figure;
index = 1;
for i = 1:length(T)
    [Filtim, MTF] = ideal(add, T(i));
    [X,Y] = meshgrid(1:size(MTF,1),1:size(MTF,2));
    subplot(length(T),2,index);
    showgray(Filtim)
    index = index +1;
    subplot(length(T),2,index);
    surf(X,Y,+MTF);
    index = index +1;
end


