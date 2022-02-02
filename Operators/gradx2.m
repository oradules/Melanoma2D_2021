%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 2-dimensional distribution and returns the
%%%%% derivative of this distribution through its spatial (1st & 2nd)
%%%%% dimensions, as a gradient vector
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = gradx2(in)

global dx

out = zeros([size(in),2]);

out(:,:,:,1) = in([2,3:end,end],:,:) - in([1,1:end-2,end-1],:,:);
out(:,:,:,2) = in(:,[2,3:end,end],:) - in(:,[1,1:end-2,end-1],:);

out = (1/(2*dx))*out;

end