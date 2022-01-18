
global Np dt x y y1 y2 dx dy

oldpath = path;
path(path,'Model');
path(path,'Operators');
path(path,'Parameters');

tic; 
svpth = [pwd,'/images/'];

dt = .2; Tmx = 360; t = 0:dt:Tmx;
Np = 2; ptt = cell(Np,1);
stt = 40; stvC = [.055,.01]; svC = []; ttrt = []; ptrt = 1;
ch = 0; trt = 0;
dx = .02; x = (0:dx:1)'; dy = .02; y = (0:dy:1)';
y1 = repmat(y,1,length(y)); y2 = repmat(y',length(y),1);

[c,v,m,p] = init; v0 = v;
vC = zeros(length(t),1); Stts = [];
        
F = figure(2); clf; hold on;
imagesc(x,x,v0'); colorbar; axis([0 1 0 1]);
print(F,'-r600',[svpth,'v0.png'],'-dpng');

for i = t
    %% treatement regimen
    if and(not(isempty(svC)),rem(i,1)<1e-4)
      if vC(tpos)>=svC(1); ch = 0; trt = 1;
        if isempty(ttrt)
          ttrt = i; ptt{ptrt} = [ptt{ptrt};i,inf];
        end
      elseif vC(tpos)<svC(2)
        ttrt = []; trt = 0;
        if ch==0
          ptt{ptrt}(end,2) = i; ch = 1;
        end
      end
    end
    if trt==1
      if i>=(ttrt) && i<(ttrt+1)
        p(:,:,ptrt) = p(:,:,ptrt) + .3*dt*v0;
      elseif i>=(ttrt+1)
        p(:,:,ptrt) = p(:,:,ptrt) + .3*dt*(1-p(:,:,ptrt)).*v;
      end
      for j = 1:Np
        if j==ptrt; continue; end
        p(:,:,j) = p(:,:,j) - .5*dt*p(:,:,j);
      end
    else; p = p - .5*dt*p;
    end
    
    %% predictor step
    cnew = c + dt*partialc(c,v,m,p);
    vnew = v + dt*partialv(c,v,m,p);
    mnew = m + dt*partialm(c,v,m,p);
    pnew = p + dt*partialp(c,v,m,p);
    
    %% corrector step
    c = .5*(c+cnew) + .5*dt*partialc(cnew,vnew,mnew,pnew);
    v = .5*(v+vnew) + .5*dt*partialv(cnew,vnew,mnew,pnew);
    m = .5*(m+mnew) + .5*dt*partialm(cnew,vnew,mnew,pnew);
    p = .5*(p+pnew) + .5*dt*partialp(cnew,vnew,mnew,pnew);
    
    %%
    c(c<0) = 0;
    v(v<0) = 0; v(v>1) = 1;
    m(m<0) = 0; m(m>1) = 1;
    p(p<0) = 0; p(p>1) = 1;
    
    %% Figures
    tpos = find(abs(t-i)<.5*dt,1);
    vC(tpos) = intx2(inty(c));
    if abs(i-stt)<.5*dt; svC = stvC; end
    if rem(i,1)<1e-4
      Tmp = cstats(c); [lTmp,~] = size(Tmp);
      Stts = [Stts;(0:lTmp-1)',i*ones(lTmp,1),Tmp];
      save([svpth,'Stts.mat'],'Stts');
      makefigs(i,c,v,m,p,t,vC,stvC,ptt,1,svpth); close all;
      fprintf('Done %i in %f seconds\n',i/dt,toc); pause(.01);
    end
    
end
save([svpth,'Stts.mat'],'Stts');
makefigs(i,c,v,m,p,t,vC,ptt,1,svpth); close all;
path(oldpath);

fprintf('Completed in %f seconds\n',toc);
