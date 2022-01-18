function out = intx(in)

global dx

out1 = squeeze(sum(in,2) + sum(in(:,2:end-1,:,:),2));
out = squeeze(sum(out1,1) + sum(out1(2:end-1,:,:),1));

out = ((.5*dx)^2)*out;

end