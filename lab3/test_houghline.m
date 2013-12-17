%%
close all;
clc;

scale = 4;
nrho = 256;
ntheta = 180;
threshold = 20;
nlines = 10;
verbose = 0;

dim = 256;
tempPic = zeros(dim);

for i = 1:dim
    for j = 1:dim
       if i > 50 && i < 200
           if i + j >= 150 && i + j <= 175 
               tempPic(i,j) = 100;
           end
       end
    end
end

for i = 1:dim
    for j = 1:dim
       if i > 50 && i < 200
           if i >= 150 && i <= 175 
               tempPic(i,j) = 100;
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


houghedgeline(tempPic,scale,0,nrho,ntheta,4, verbose);

%%

figure;
test = houghtest256;
subplot(1,2,1)
showgrey(test)
subplot(1,2,2)
houghedgeline(test,scale,threshold,nrho,ntheta,nlines, verbose);
%% 
figure;
test = few256;
subplot(1,2,1)
showgrey(test)
subplot(1,2,2)
houghedgeline(test,scale,threshold,nrho,ntheta,nlines, verbose);
%%
figure;
test = phonecalc256;
subplot(1,2,1)
showgrey(test)
subplot(1,2,2)
houghedgeline(test,scale,threshold,nrho,ntheta,nlines, verbose);
%%
figure;
test = godthem256;
subplot(1,2,1)
showgrey(test)
subplot(1,2,2)
houghedgeline(test,scale,threshold,nrho,ntheta,nlines, verbose);