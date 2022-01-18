function out = projy(in)

global x y

lenx = length(x); leny = length(y);

iny = zeros(1,1,leny,leny); iny(1,1,:,:) = in;
out = repmat(iny,lenx,lenx,1,1);

end