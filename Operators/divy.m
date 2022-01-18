function out = divy(in)

global dy

dvy1 = in(:,:,[2,3:end,end],:,1) - in(:,:,[1,1:end-2,end-1],:,1);
dvy2 = in(:,:,:,[2,3:end,end],2) - in(:,:,:,[1,1:end-2,end-1],2);

out = (1/(2*dy))*(dvy1 + dvy2);

end