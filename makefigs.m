function makefigs5(it,c,v,m,p,t,vC,svC,ptt,svfg,svpth)

global Np dt x y y1 y2 dx dy

sf = .3; %scaling factor

hdlx = round(2*(length(x)-1))+1;
if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  CC = zeros(hdlx,hdlx); CC(1:2:end,1:2:end) = intx(c)';
  CC(2:2:end,:) = .5*(CC(1:2:end-2,:)+CC(3:2:end,:));
  CC(:,2:2:end) = .5*(CC(:,1:2:end-2)+CC(:,3:2:end));
  imagesc(y,y,CC); colorbar; axis([0 1 0 1]);
  xlabel('y_1','FontSize',20); ylabel('y_2','FontSize',20);
if svfg
  print(F,'-r300',[svpth,'Cy,t=',num2str(it),'.png'],'-dpng');
end

% Nr = 120;
% F = figure(11); clf; hold on; set(gca,'FontSize',16)
%   axis([0 1 0 1]); Cy = intx(c);
%   for j = 1:Nr
%     CDF1 = cumsum(double(inty21(Cy))); CDF1 = CDF1/CDF1(end);
%     r = rand; xxi = find([0;CDF1(1:end-1)]<r&[CDF1(2:end);1]>r,1);
%     xxi = y(xxi)+dy*((r - CDF1(xxi))/(CDF1(xxi+1)-CDF1(xxi)));
%     CDF2 = cumsum(interp2(y,y,Cy,y,xxi)); CDF2 = CDF2/CDF2(end);
%     r = rand; nnu = find([0,CDF2(1:end-1)]<r&[CDF2(2:end),1]>r,1);
%     nnu = y(nnu)+dy*((r - CDF2(nnu))/(CDF2(nnu+1)-CDF2(nnu)));
%     if isempty(nnu)==0; plot(xxi,nnu,'r.','MarkerSize',10); end
%   end; xlabel('y_1','FontSize',20); ylabel('y_2','FontSize',20);
% if svfg
%   print(F,'-r300',[svpth,'Cy_s,t=',num2str(t),'.png'],'-dpng');
% end

hdly = round(2*(length(y)-1))+1;
if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  CC = zeros(hdly,hdly); CC(1:2:end,1:2:end) = inty(c)';
  CC(2:2:end,:) = .5*(CC(1:2:end-2,:)+CC(3:2:end,:));
  CC(:,2:2:end) = .5*(CC(:,1:2:end-2)+CC(:,3:2:end));
  imagesc(x,x,inty(c)'); colorbar; axis([0 1 0 1]); caxis([0 1]);
  xlabel('x_1','FontSize',20); ylabel('x_2','FontSize',20);
if svfg
  print(F,'-r300',[svpth,'Cx,t=',num2str(it),'.png'],'-dpng');
end

ln = .1; fcol = [.5,1,.5;1,1,.5];
if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  set(F,'position',[100,200,1000,400]);
%   vcmax = max(vC(int16(30/dt):int16(50/dt)));
  vcmax = find(vC(2:end)-vC(1:end-1)<0,1);
  if isempty(vcmax); vcmax = vC(ppos); else; vcmax = vC(vcmax); end
  pmx = 1800; ivcm = pmx/vcmax; ivcm(isnan(ivcm)) = 1;
  for i = 1:Np
    [lptt,~] = size(ptt{i});
    for j = 1:lptt
      if isinf(ptt{i}(j,1)); continue;
      else
        if isinf(ptt{i}(j,2)); crr = [ptt{i}(j,1),max(t)];
        else; crr = ptt{i}(j,:);
        end
        fill(sf*[crr,flip(crr)],ivcm*[pmx,pmx,0,0],fcol(i,:),...
            'EdgeAlpha',0,'FaceAlpha',.5)
      end
      if j<lptt
        if isinf(ptt{i}(j+1,1))
          crr = [ptt{i}(j,2),max(t)];
        else
          crr = [ptt{i}(j,2),ptt{i}(j+1,1)];
        end
        fill(sf*[crr,flip(crr)],ivcm*[pmx,pmx,0,0],[1,.5,.5],...
            'EdgeAlpha',0,'FaceAlpha',.5)
      end
    end
  end
  plot(sf*t,ivcm*vC,'b-','LineWidth',1);
  if not(isempty(svC))
    plot(sf*t,ivcm*svC(1)*ones(size(t)),'k--','LineWidth',1);
    plot(sf*t,ivcm*svC(2)*ones(size(t)),'k--','LineWidth',1);
  end
  axis([0 sf*max(t) 0 pmx*(1+ln)]);
  xlabel('t (days)','FontSize',20); ylabel('Volume (mm^3)','FontSize',20);
if svfg
  print(F,'-r300',[svpth,'vC.png'],'-dpng');
end

if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  imagesc(x,x,sum(p,3)'); colorbar;
  axis([0 1 0 1]); caxis([0 1]);
  xlabel('x_1','FontSize',20); ylabel('x_2','FontSize',20);
if svfg
  print(F,'-r300',[svpth,'p,t=',num2str(it),'.png'],'-dpng');
end

fldr = '0Modes/';
MnMx = [0,.6,0,.75;0,2,.75,2;.6,2,0,.75];
Cols = [1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1];
ccol = zeros(1,1,3); ccol(1,1,:) = Cols(1,:);
lx = length(x); ly = length(y); [Nm,~] = size(MnMx);
crel = 1e-4; cmx = inty(c); ctt = intx2(cmx); cmx = max(cmx(:));
Tmp = inty(c)'; CT = repmat(Tmp./max(Tmp(:)),1,1,3).*repmat(ccol,lx,lx,1);
if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  image(x,x,CT); axis([0 1 0 1]);
  xlabel('x_1','FontSize',20); ylabel('x_2','FontSize',20);
if svfg
  fnm = [svpth,fldr,'Cx,mode0,t=',num2str(it),'.png'];
  print(F,'-r300',fnm,'-dpng');
end; CT = zeros(size(CT)); pCT = CT;
Y1 = zeros(1,1,ly,ly); Y1(1,1,:,:) = y1; Y1 = repmat(Y1,lx,lx,1,1);
Y2 = zeros(1,1,ly,ly); Y2(1,1,:,:) = y2; Y2 = repmat(Y2,lx,lx,1,1);
for i = 1:Nm
  ccol = zeros(1,1,3); ccol(1,1,:) = Cols(i,:);
  Cnd = and(Y1>=MnMx(i,1),Y1<MnMx(i,2)).*and(Y2>=MnMx(i,3),Y2<MnMx(i,4));
  Tmp = inty(Cnd.*c)';
  if intx2(Tmp)>crel*ctt
%     Tmp = log2(Tmp'./(crel*cmx))./abs(log2(crel));
    Tmp = sqrt(Tmp'./cmx);
    CC = repmat(Tmp,1,1,3).*repmat(ccol,lx,lx,1);
  else; continue;
  end
  if svfg; F=figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
  else; figure(5); clf; hold on; set(gca,'FontSize',16)
  end
    image(x,x,CC); axis([0 1 0 1]);
    xlabel('x_1','FontSize',20); ylabel('x_2','FontSize',20);
  if svfg
    fnm = [svpth,fldr,'Cx,mode',num2str(i-1),',t=',num2str(it),'.png'];
    print(F,'-r300',fnm,'-dpng');
  end; CT = CT + CC;
  if svfg; F=figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
  else; figure(5); clf; hold on; set(gca,'FontSize',16)
  end
end
Cnd = zeros(1,1,3); Cnd(1,1,:) = sum(Cols(1:Nm,:),1);
CT(Cnd>0) = CT(Cnd>0)./Cnd(Cnd>0);
if svfg; F = figure('visible','off'); clf; hold on; set(gca,'FontSize',16)
else; figure(5); clf; hold on; set(gca,'FontSize',16)
end
  image(x,x,CT); axis([0 1 0 1]);
  xlabel('x_1','FontSize',20); ylabel('x_2','FontSize',20);
if svfg
  fnm = [svpth,fldr,'Cx,Merge,t=',num2str(it),'.png'];
  print(F,'-r300',fnm,'-dpng');
end

end