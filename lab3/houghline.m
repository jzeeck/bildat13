function [ linepar, acc ] = houghline( curves, magnitude, ...
                 nrho, ntheta, threshold, nlines, verbose )

             
% Check if input appear to be valid
if (nargin < 6)
	error( 'Wrong # of arguments.')
end
if (nargin < 7)
	verbose = 0;
end

[~, m] = size(curves);
temp = curves.*curves;
temp = temp(:,1)+ temp(:,2);
maxrho = max(sqrt(temp));

% Allocate accumulator space this is given by nrho and nrtheta
acctmp = zeros(ntheta, nrho);

% Define a coordinate system in the accumulator space
rho = linspace(-maxrho,maxrho,nrho);
theta = linspace(0,pi-(pi/ntheta),ntheta);

% Loop over all the input curves

for i = 1:m
    % For each point on each curve
      % Optionally, get value from magnitude image
      % Loop over a set of theta values
      fprintf('Point %d (x,y) (%d,%d)\n',i,curves(1,i),curves(2,i))
      fprintf('Angle \t Dist.\n')
      for j = 1:length(theta)
          x = curves(1,i);
          y = curves(2,i);
          c = sqrt(x^2 + y^2);
          % Compute rho for each theta value
          rhotemp =(c* cos(atan(y/x) - theta(j)));
          fprintf('%.0f \t %.2f\n',180/pi*theta(j),rhotemp)
          % Compute index values in the accumulator space
          rhoindex = findRhoIndex(rhotemp,rho);
          % Update the accumulator
          acctmp(j, rhoindex) = acctmp(j, rhoindex) + 1; 
      end
end
acctmp

% Extract local maxima from the accumulator
[pos, value, ~] = locmax8(acctmp)
[dummy, indexvector] = sort(value);
nmaxima = size(value, 1);
% Delimit the number of responses if necessary
if nlines < length(indexvector)
    for idx = 1:nlines
        rhoidxacc = pos(indexvector(nmaxima - idx + 1), 1)
        thetaidxacc = pos(indexvector(nmaxima - idx + 1), 2)
    end
end
% Compute a line for each one of the strongest responses in the accumulator
% Overlay these curves on the gradient magnitude image
% Return the output data

end

