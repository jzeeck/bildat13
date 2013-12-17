function [ linepar, acc ] = houghline( curves, magnitude, ...
                 nrho, ntheta, threshold, nlines, verbose )

             
% Check if input appear to be valid
if (nargin < 6)
	error( 'Wrong # of arguments.')
end
if (nargin < 7)
	verbose = 0;
end

[dimx, dimy] = size(magnitude);
dim = max(dimx, dimy);

[~, m] = size(curves);
temp = curves.*curves;
temp = temp(1,:)+ temp(2,:);
maxrho = max(sqrt(temp));

% Allocate accumulator space this is given by nrho and nrtheta
acc = zeros(ntheta, nrho);

% Define a coordinate system in the accumulator space
rho = linspace(-maxrho,maxrho,nrho);
theta = linspace(0,pi-(pi/ntheta),ntheta);

% Loop over all the input curves
for i = 1:m
    % For each point on each curve
      % Optionally, get value from magnitude image
      % Loop over a set of theta values
      if verbose >0
      fprintf('Point %d (x,y) (%d,%d)\n',i,curves(1,i),curves(2,i))
      fprintf('Angle \t Dist.\n')
      end
      for j = 1:length(theta)
          x = curves(1,i);
          y = curves(2,i);
          % Compute rho for each theta value
          rhotemp = x*cos(theta(j)) + y*sin(theta(j));
          if verbose >0
          fprintf('%.0f \t %.2f\n',180/pi*theta(j),rhotemp)
          end
          % Compute index values in the accumulator space
          rhoindex = findRhoIndex(rhotemp,rho);
          % Update the accumulator
          acc(j, rhoindex) = acc(j, rhoindex) + ...
              abs(magnitude(uint32(curves(2,i)),uint32(curves(1,i))))^(1/3); 
      end
end
if verbose>0
acc
end
for i = 1:size(acc,1)
    for j = 1:size(acc,2)
     if acc(i,j) < threshold
         acc(i,j) = 0;
     end
    end 
end

% Extract local maxima from the accumulator
[pos, value, ~] = locmax8(acc);
[~, indexvector] = sort(value);
nmaxima = size(value, 1);
% Delimit the number of responses if necessary
if nlines < length(indexvector)
   indexMax = nlines;
else
    indexMax = length(indexvector);
end
% Compute a line for each one of the strongest responses in the accumulator
linepar = zeros(2,indexMax);
outcurves = zeros(2,indexMax*4);
for idx = 1:indexMax
    rhoidxacc = pos(indexvector(nmaxima - idx + 1), 2);
    thetaidxacc = pos(indexvector(nmaxima - idx + 1), 1);
    linepar(1,idx) = rho(rhoidxacc);
    linepar(2,idx) = theta(thetaidxacc);
    if verbose>0
    currentRho = rho(rhoidxacc)
    currentTheta = 180/pi*theta(thetaidxacc)
    end
    
    y0 = dimx/2;
    x0 = (rho(rhoidxacc) - y0 * cos(theta(thetaidxacc))) / sin(theta(thetaidxacc));
    
    dy = sin(theta(thetaidxacc));
    dx = -cos(theta(thetaidxacc));
    
    if abs(dy) < abs(dx)
        x0 = dimy/2;
        y0 = (rho(rhoidxacc)- x0 * sin(theta(thetaidxacc))) / cos(theta(thetaidxacc));
    end
    hold on
    plot(x0,y0,'r+')
    hold off
    
    outcurves(1, 4*(idx-1) + 1) = 0;
    outcurves(2, 4*(idx-1) + 1) = 3;
    outcurves(2, 4*(idx-1) + 2) = x0-(dx*dim);
    outcurves(1, 4*(idx-1) + 2) = y0-(dy*dim);
    outcurves(2, 4*(idx-1) + 3) = x0;
    outcurves(1, 4*(idx-1) + 3) = y0;

    outcurves(2, 4*(idx-1) + 4) = x0+(dx*dim);
    outcurves(1, 4*(idx-1) + 4) = y0+(dy*dim);
end
if verbose >0
outcurves
end
% Overlay these curves on the gradient magnitude image
overlaycurves(magnitude*-1,outcurves);


% Return the output data

end

