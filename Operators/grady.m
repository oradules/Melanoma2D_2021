%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 4-dimensional distribution and returns the
%%%%% derivative of this distribution through its structural (3rd & 4th)
%%%%% dimensions, as a gradient vector
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = grady(in)

global dy

out = zeros([size(in),2]);

out(:,:,:,:,1) = in(:,:,[2,3:end,end],:) - in(:,:,[1,1:end-2,end-1],:);
out(:,:,:,:,2) = in(:,:,:,[2,3:end,end]) - in(:,:,:,[1,1:end-2,end-1]);

out = (1/(2*dy))*out;

end