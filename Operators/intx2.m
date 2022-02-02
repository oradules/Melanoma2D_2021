%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as inputs a 2-dimensional distribution and returns the
%%%%% integral of this distribution through its spatial (1st & 2nd)
%%%%% dimensions
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = intx2(in)

global dx

out1 = squeeze(sum(in,2) + sum(in(:,2:end-1),2));
out = squeeze(sum(out1,1) + sum(out1(2:end-1),1));

out = ((.5*dx)^2)*out;

end