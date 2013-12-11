clc;
[x y] =  meshgrid(-5:5, -5:5)

dxmask = ...
    [0 0    0 0   0
     0 0    0 0   0
     0 -0.5 0 0.5 0
     0 0    0 0   0
     0 0    0 0   0];
 
dymask = ...
    [0 0 0    0 0
     0 0 0.5  0 0
     0 0 0    0 0
     0 0 -0.5 0 0
     0 0 0    0 0];
 
 
dxxmask = ...
    [0 0 0  0 0
     0 0 0  0 0
     0 1 -2 1 0
     0 0 0  0 0
     0 0 0  0 0];
 
dyymask = ...
    [0 0 0  0 0
     0 0 1  0 0
     0 0 -2 0 0
     0 0 1  0 0
     0 0 0  0 0];

dxxxmask = conv2(dxmask,dxxmask);
dxxxmask = dxxxmask(3:7, 3:7);

dxxymask = conv2(dxxmask,dymask);
dxxymask = dxxymask(3:7, 3:7);

 
filter2(dxxxmask, x .^3, 'valid')

filter2(dxxmask, x .^3, 'valid')

filter2(dxxymask, x .^2 .* y, 'valid')

filter2(dxxxmask, y .^10, 'valid')

filter2(dymask, y , 'valid')

% temp = x .^3

% temp = x .^2 .*y

% temp = x .^2 .*y

house = godthem256;

figure;
scale = [0.0001, 1.0, 4.0, 16.0, 64.0];
for i = 1:length(scale)
    subplot(2, 3, i);
    contour(Lvvtilde(discgaussfft(house, scale(i)), 'same'), [0 0])
    axis('image')
    axis('ij')
    title(['scale = ' int2str(scale(i))]);
end
subplot(2, 3, 6);
showgray(house);


figure;
scale = [0.0001, 1.0, 4.0, 16.0, 64.0];
for i = 1:length(scale)
    subplot(2, 3, i);
    contour(Lvvvtilde(discgaussfft(house, scale(i)), 'same') < 0)
    axis('image')
    axis('ij')
    title(['scale = ' int2str(scale(i))]);
end
subplot(2, 3, 6);
showgray(house);
