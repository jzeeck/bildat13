function edgecurves = njetedge( inpic, scale, threshold, shape )

if (nargin < 2)
	error( 'Wrong # of arguments.')
end

if (nargin < 4)
    shape = 'same';
end

edgecurves = zerocrosscurves(Lvvtilde(discgaussfft(inpic, scale), shape), ...
    Lvvvtilde(discgaussfft(inpic, scale), shape) < 0);

if (nargin >= 3)
	Lvtemp = Lv(discgaussfft(inpic,scale)) > (threshold/sqrt(scale));
    Lvtemp = Lvtemp - 1;
    edgecurves = thresholdcurves(edgecurves, Lvtemp);
end




end

