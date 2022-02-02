%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs the gradient of a 4-dimensional distribution
%%%%% and returns the derivative of this distribution through its
%%%%% structural (1st & 2nd) dimensions, as a divergence
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = divx(in)

global dx

dvx1 = in([2,3:end,end],:,:,:,1) - in([1,1:end-2,end-1],:,:,:,1);
dvx2 = in(:,[2,3:end,end],:,:,2) - in(:,[1,1:end-2,end-1],:,:,2);

out = (1/(2*dx))*(dvx1 + dvx2);

end