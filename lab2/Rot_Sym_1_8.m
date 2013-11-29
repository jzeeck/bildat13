clc;
clear all;
close all;

[G H] = meshgrid(-64: 63, -64: 63);
F = G .^ 2 + H .^ 2 <= 128;
subplot(2,1,1)
showgrey(F)
subplot(2,1,2)
showfs(fft2(F))

G = [F(:, 21:128) F(:,1:20)];
figure;
subplot(2,2,1)
showgrey(G);
title('G')
axis on
subplot(2,2,2)
showfs(fft2(G))
title('fft2(G)')
subplot(2,2,3)
showgrey(angle(fft2(G)), 64, -pi, pi);
title('phase shift of fft2(G)')
subplot(2,2,4)
showgrey(angle(fft2(F)), 64, -pi, pi);
title('phase shift of fft2(F)')