function out = divx2(in)

global dx

dvx1 = in([2,3:end,end],:,:,1) - in([1,1:end-2,end-1],:,:,1);
dvx2 = in(:,[2,3:end,end],:,2) - in(:,[1,1:end-2,end-1],:,2);

out = (1/(2*dx))*(dvx1 + dvx2);

end