clc;
clear all;
close all;

F = [zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
H = F + 2 * G;

showgray(F);

Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);

figure;

subplot(3, 2, 1);
showgrey(log(1 + abs(Fhat)));
title('log abs Fhat')

subplot(3, 2, 2);
showgrey(log(1 + abs(Ghat)));
title('log abs Ghat, G = inverser(F)')

subplot(3, 2, 3);
showgrey(log(1 + abs(Hhat)));
title('log abs Hhat, H = F + 2 * G')

subplot(3, 2, 4);
showgrey(log(1 + abs(fftshift(Hhat))));
title('log(1 + abs(fftshift(Hhat)))')

subplot(3, 2, 5);
showgrey(F .* G);
title('F .* G')

subplot(3, 2, 6);
showfs(fft2(F .* G));
title('fft2(F .* G)')
figure;
showfs(log( 1 + abs(fftshift(conv2(fftshift(fft2(F)/128), fftshift(fft2(G)/128))))))