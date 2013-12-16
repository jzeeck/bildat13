function [ linepar, acc ] = houghedgeline( pic, scale, gradmagnthreshold, ...
                                            nrho, ntheta, nlines, verbose)

                                        
curves  = njetedge(pic, scale, gradmagnthreshold);
gradient = Lv(pic);

%remove all the index elements
temp = [];
for i =1:size(curves, 2)
    if curves(1,i) ~= 0
        temp = [temp curves(:,i)];
    end
end

                                        
[ linepar, acc ] = houghline( temp, gradient, ...
                 nrho, ntheta, gradmagnthreshold, nlines, verbose );


end

