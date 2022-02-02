%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 2-dimensional spatial distribution and
%%%%% returns the numerical projection of this distribution through an
%%%%% additional 2 structural dimensions
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = projx(in)

global y

leny = length(y);

out = repmat(in,1,1,leny,leny);

end