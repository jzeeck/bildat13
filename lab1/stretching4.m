n_float = nallo256float;
figure('name','Original');
showgray(n_float)
figure('name','Histogram of Original');
hist(n_float(:))
[no,xo] = hist(n_float(:));
%prob = no/sum(no)

x = (0:0.005:1)';
y = x.^(1/4);
figure('name','Transformed func');
plot (x,y);

tran = n_float.^(1/4);
figure('name','Transformed Image');
showgray(tran)

figure('name','Histogram of Transformed Imager');
hist(tran(:))
