function [ linepar, acc ] = houghedgeline( pic, scale, gradmagnthreshold, ...
                                            nrho, ntheta, nlines, verbose)

                                        
curves  = njetedge(pic, scale, gradmagnthreshold);
                                        
[ linepar, acc ] = houghline( curves, gradmagnthreshold, ...
                 nrho, ntheta, threshold, nlines, verbose );


end

