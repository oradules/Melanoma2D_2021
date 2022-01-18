function out = projx(in)

global y

leny = length(y);

out = repmat(in,1,1,leny,leny);

end