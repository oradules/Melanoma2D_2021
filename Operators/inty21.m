%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 2-dimensional distribution and returns the
%%%%% integral of this distribution through its 2nd dimension
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = inty21(in)

global dy

out = sum(in(:,1:end-1) + in(:,2:end),2);
out = (.5*dy)*out;

end