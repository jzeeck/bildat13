load canoe256;
% neg1 = - Canoe;
% figure(1);
% showgrey(neg1);
neg2 = 255-Canoe;
% figure(2);
% showgray(neg2)
% 
% nallo = nallo256;
% figure(3);
% showgray(nallo.^(1/3));
% figure(4);
% showgray(cos(nallo/10));
% figure(5);
% hist(neg1(:));
% figure(6);
% hist(neg2(:));

negtransf = (255:-1:0)';
neg3 = compose(negtransf, Canoe + 1); 

diff = neg3 - neg2
figure(7);
image(diff);
figure(8);
hist(diff(:));

negcolormapcol = linspace(1,0,256)';

colormap([negcolormapcol negcolormapcol negcolormapcol]);

showgrey(Canoe,linspace(1,0,256),0,255)
