%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 2-dimensional structural distribution and
%%%%% returns the numerical projection of this distribution through an
%%%%% additional 2 spatial dimensions
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = projy(in)

global x y

lenx = length(x); leny = length(y);

iny = zeros(1,1,leny,leny); iny(1,1,:,:) = in;
out = repmat(iny,lenx,lenx,1,1);

end