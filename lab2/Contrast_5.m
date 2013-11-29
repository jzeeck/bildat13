close all;
clear all;
clc;

office = office256;
add = gaussnoise(office, 16);
sap = sapnoise(office, 0.1, 255);

laplace = [0 1 0; 1 -4 1; 0 1 0];

laplaceblocks = conv2(blocks1, laplace, 'valid');
figure;
showgrey(laplaceblocks);
figure;
showgrey(conv2(add,laplace, 'valid'));
figure;
showgrey(conv2(sap,laplace, 'valid'));


stripblocks = conv2(blocks1, [0 0 0; 0 1 0;0 0 0], 'valid');
sharpblocks = stripblocks - (0.2 * laplaceblocks);

figure;
showgray(sharpblocks)

figure;
subplot(3,1,1)
showgray(blocks1);
subplot(3,1,2)
showgray(sharpblocks)
subplot(3,1,3)
sharpblocks = conv2(blocks1, [0 0 0; 0 1 0;0 0 0] - 0.2*laplace,'valid');
showgray(sharpblocks)