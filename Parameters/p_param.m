%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Code written by Arran Hodgkinson, University of Exeter, January 2022
%%%%% Module generates a set of parameters for the simulation of the
%%%%% derivative of the drug moelcule distribution w.r.t. time
%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Dp,del_p,ndel_p] = p_param0

%% Spatial Diffusion Parameters

Dp = [1.2e-3;1.2e-3];

%% Degradation Parameters

del_p = [.65;.65]; ndel_p = [5e-3;5e-3];

end