close all;
clc;
curves = [40 57 74
          70 60 50];
magnitude = 4711;
nrho = 10;
ntheta = 6;
threshold = 4711;
nlines = 2;
verbose = 0;


tempPic = ones(128);
for i = 1:size(curves, 2)
    tempPic(curves(1,i),curves(2,i)) = 0;
end
figure;
showgray(tempPic)

houghline(curves,magnitude,nrho,ntheta,threshold,nlines, verbose);


figure;
t = triangle128;
showgrey(t)
c = zerocrosscurves(t-128);
overlaycurves(t, c)
figure;
showgrey(pixelplotcurves(t, c, -128));

