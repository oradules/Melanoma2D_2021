%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module takes as input the 4-dimensional melanoma cell population and
%%%%% generates a set of statistical measures which characterise this
%%%%% distribution, through all of its dimensions
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function stts = cstats(c)

global x dy y1 y2

lx = length(x); X1 = repmat(x,1,lx); X2 = repmat(x',lx,1);
Cy = intx(c);
GxCy = (Cy(2:end,2:end-1)-Cy(1:end-1,2:end-1))./dy;
GxCy = sign(GxCy(2:end,:))==sign(GxCy(1:end-1,:));
GyCy = (Cy(2:end-1,2:end)-Cy(2:end-1,1:end-1))./dy;
GyCy = sign(GyCy(:,2:end))==sign(GyCy(:,1:end-1));

gX1 = X1(2:end-1,2:end-1); gX2 = X2(2:end-1,2:end-1);
gX1 = gX1(not(or(GxCy,GyCy))); gX2 = gX2(not(or(GxCy,GyCy)));

y1cm = intx2(Cy.*y1)./intx2(Cy); y2cm = intx2(Cy.*y2)./intx2(Cy);
y1cs = intx2(Cy.*(y1.^2))./intx2(Cy) - y1cm^2;
y2cs = intx2(Cy.*(y2.^2))./intx2(Cy) - y2cm^2;

th = .01; CyLb = bwlabel(Cy./max(Cy(:))>=th); mxLb = max(CyLb(:));
mLb = zeros(mxLb,1); for i = 1:mxLb; mLb(i) = intx2((CyLb==i).*Cy); end
[~,ord] = sort(mLb,'descend');
y1cm = [y1cm;zeros(mxLb,1)]; y2cm = [y2cm;zeros(mxLb,1)];
y1cs = [y1cs;zeros(mxLb,1)]; y2cs = [y2cs;zeros(mxLb,1)];
for i = 1:mxLb
  Crr = (CyLb==ord(i)).*Cy;
  y1cm(i+1) = intx2(Crr.*y1)./intx2(Crr);
  y2cm(i+1) = intx2(Crr.*y2)./intx2(Crr);
  y1cs(i+1) = intx2(Crr.*(y1.^2))./intx2(Crr) - y1cm(i+1)^2;
  y2cs(i+1) = intx2(Crr.*(y2.^2))./intx2(Crr) - y2cm(i+1)^2;
end
stts = [y1cm,y2cm,y1cs,y2cs];

end