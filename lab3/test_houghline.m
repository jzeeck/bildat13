%%
close all;
clc;
% curves = [50 1 50 45
%           1 50 25 45];
% magnitude = 4711;
nrho = 100;
ntheta = 30;
threshold = 0.1;
nlines = 4;
verbose = 0;
% 
% 
% 
% for i = 1:size(curves, 2)
%     tempPic(curves(1,i),curves(2,i)) = 0;
% end

dim = 256;
tempPic = zeros(dim);

for i = 1:dim
    for j = 1:dim
       if i > 50 && i < 200
           if i + j >= 150 && i + j <= 175 
               tempPic(i,j) = 1;
           end
       end
    end
end

for i = 1:dim
    for j = 1:dim
       if i > 50 && i < 200
           if i >= 150 && i <= 175 
               tempPic(i,j) = 1;
           end
       end
    end
end
figure;
subplot(1,2,1)
showgray(tempPic)
axis on;


subplot(1,2,2)
curves  = njetedge(tempPic,1.0,0.01);
overlaycurves(tempPic, curves);


houghedgeline(tempPic,1.0,threshold,nrho,ntheta,nlines, verbose);

%%

figure;
test = houghtest256;
subplot(1,2,1)
showgrey(test)
subplot(1,2,2)
houghedgeline(test,1.0,threshold,nrho,ntheta,10, verbose);
% 
% figure;
% t = triangle128;
% showgrey(t)
% c = zerocrosscurves(t-128);
% overlaycurves(t, c)
% figure;
% showgrey(pixelplotcurves(t, c, -128));
% 
