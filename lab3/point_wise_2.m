close all;
clear all;
clc;

tools = few256;

deltax = [-1 1;-1 1];
deltay = [-1 -1;1 1];

dxtoolsconv = conv2(tools, deltax, 'valid');
dytoolsconv = conv2(tools, deltay, 'valid');

figure;
gradmagntools = sqrt(dxtoolsconv.^2 +dytoolsconv.^2);
showgray(gradmagntools)

figure;
t = [4.0, 8.0, 16.0, 32.0, 64.0, 128.0];
for i = 1:length(t)
    subplot(2, 3, i);
    showgray((gradmagntools- t(i)) > 0);
    title(['threshold = ' int2str(t(i))]);
end

gradmagntools = Lv(tools);
figure;
showgray(sqrt(gradmagntools));

figure;
t = [8.0, 16.0, 32.0, 64.0, 128.0, 256.0];
for i = 1:length(t)
    subplot(2, 3, i);
    showgray((gradmagntools- t(i)^2) > 0);
    title(['threshold = ' int2str(t(i)^2)]);
end