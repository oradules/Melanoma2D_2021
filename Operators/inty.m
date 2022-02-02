%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 4-dimensional distribution and returns the
%%%%% integral of this distribution through its structural (3rd & 4th)
%%%%% dimensions
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = inty(in)

global dy

out1 = sum(in,4) + sum(in(:,:,:,2:end-1),4);
out = sum(out1,3) + sum(out1(:,:,2:end-1),3);

out = ((.5*dy)^2)*out;

end