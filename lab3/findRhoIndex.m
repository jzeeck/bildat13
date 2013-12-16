function index = findTheIndex(rhotemp,rhoarray)

diff = abs(rhoarray - rhotemp);

index = find(diff == min(diff));

end