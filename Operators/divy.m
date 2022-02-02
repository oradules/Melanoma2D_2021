%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs the gradient of a 4-dimensional distribution
%%%%% and returns the derivative of this distribution through its
%%%%% structural (3rd & 4th) dimensions, as a divergence
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = divy(in)

global dy

dvy1 = in(:,:,[2,3:end,end],:,1) - in(:,:,[1,1:end-2,end-1],:,1);
dvy2 = in(:,:,:,[2,3:end,end],2) - in(:,:,:,[1,1:end-2,end-1],2);

out = (1/(2*dy))*(dvy1 + dvy2);

end