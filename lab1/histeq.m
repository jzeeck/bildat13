function pixels = histeq( image, nacc, verbose )
if nargin == 1
  nacc = 256;
elseif nargin == 2
  verbose = -1;
end
ma = max(image(:))
binsize = ma/nacc;
temp = linspace(binsize/2,ma-(binsize/2),nacc);

[nk,rk] = hist(image(:),temp);
prob = nk/sum(nk);

if verbose > 0
	figure('name','Histogram of Original');
    hist(image(:),temp)
    [nk,rk] = hist(image(:),temp)
end
cu = cumsum(prob);

ma = max(image(:));


image_buckets = image/(ma)*nacc;

image_buckets = floor(image_buckets);

[n,m] = size(image_buckets);
for i = 1:n
   for j = 1:m
       if image_buckets(i,j) == 0
           image_buckets(i,j) = 1;
       end
   end
end

pixels = cu(image_buckets(:,:));

if verbose > 0
	figure('name','Histogram after Equalization');
    hist(pixels(:))
    [nk,rk] = hist(pixels(:))
end


end

