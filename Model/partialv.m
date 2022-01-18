function out = partialv(c,v,m,p)

[phi_v,del_v,del_v0] = v_param;

%% Source Terms

%%% Remodelling

Rem = phi_v*v.*(1-v);

%%% Degradation

Degrad = -del_v*m(:,:,2).*v - del_v0*v;


%% Total

out = Rem + Degrad;

end