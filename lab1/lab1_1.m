%{ 
load canoe256;
figure(1);
image(Canoe)
axis equal;
figure(2);
image(Canoe)
colormap(gray(256))
axis equal;

% phone

phone = phonecalc256;
figure('name','256')
showgray(phone, 256);
figure('name','2')
showgray(phone, 2);
figure('name','4')
showgray(phone, 4);
figure('name','8')
showgray(phone, 8);
figure('name','16')
showgray(phone, 16);

% what is this

vad = whatisthis256;
figure('name','what is this? - 1')
showgray(vad);

figure('name','what is this? - 2')
ma = max(vad(:));
mi = min(vad(:));
showgray(vad, 64, 8, 32);
%}
% nallo
nallo = nallo256;
figure('name','Nallo gray')
image(nallo);
colormap(gray(256));
figure('name','Nallo cool')
image(nallo);
colormap(cool);
figure('name','Nallo hot')
image(nallo);
colormap(hot);
 %}
