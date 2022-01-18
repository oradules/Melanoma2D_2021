function out = grady(in)

global dy

out = zeros([size(in),2]);

out(:,:,:,:,1) = in(:,:,[2,3:end,end],:) - in(:,:,[1,1:end-2,end-1],:);
out(:,:,:,:,2) = in(:,:,:,[2,3:end,end]) - in(:,:,:,[1,1:end-2,end-1]);

out = (1/(2*dy))*out;

end