close all;
clear all;
clc;

tools = few256;
figure;
subplot(1, 3, 1);
showgray(tools)

% fx = f(x +1,y)?f(x,y)
% fy = f(x,y +1)? f(x,y)
fprintf('few256 loaded dimention is (%d,%d)\n',dimx,dimy)

deltax = [-1 1];
deltay = [-1;1];


dxtools = conv2(tools, deltax, 'valid');
dytools = conv2(tools, deltay, 'valid');

subplot(1, 3, 2);
showgray(dxtools)
subplot(1, 3, 3);
showgray(dytools)