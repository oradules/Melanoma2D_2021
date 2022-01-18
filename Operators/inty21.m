function out = inty21(in)

global dy

out = sum(in(:,1:end-1) + in(:,2:end),2);
out = (.5*dy)*out;

end