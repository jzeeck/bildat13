n_float = nallo256float;
figure('name','Original');
showgray(n_float)
figure('name','Histogram of Original');
hist(n_float(:))

tran = log(n_float + 0.03);
figure('name','Transformed Image');
showgray(tran)
figure('name','Histogram After');
hist(tran(:))