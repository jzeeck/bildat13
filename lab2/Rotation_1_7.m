clc;
clear all;
close all;

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
    [zeros(128, 48) ones(128, 32) zeros(128, 48)];

subplot(2,2,1)
showgrey(F);
title('F')

vinkel = 30;
G = rot(F, vinkel);
subplot(2,2,2)
showgrey(G)
title(sprintf('= rot(F, vinkel = %d)',vinkel))
axis on

Ghat = fft2(G);
subplot(2,2,3)
showfs(Ghat)
title(' = fft2(G)')

Hhat = rot(fftshift(Ghat), -vinkel);
subplot(2,2,4)
showgrey(log(1 + abs(Hhat)))
title('log(1 + abs(Hhat))')