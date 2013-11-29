clc;
clear all;
close all;

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
    [zeros(128, 48) ones(128, 32) zeros(128, 48)];

subplot(2,1,1)
showgrey(F);
axis on;
subplot(2,1,2)
showfs(fft2(F));
axis on;
