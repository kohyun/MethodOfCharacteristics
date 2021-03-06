function [ P_nozzlethroat, P_static_wall ] = thermo_relation(...
                                        gamma, M_nozzlethroat, M_wall, T0, P0, R )
%gamma = 1.4        for air
%T0 = 2500 K        for project
%P0 = 5 MPa         for project
%R = 287        ASSUMPTION


%% Calculate pressure throughout nozzle throat
      
Pthroat_multiplier = (1+((gamma-1)/2)*M_nozzlethroat.^2).^(gamma/(gamma-1));
P_nozzlethroat     = P0 ./ Pthroat_multiplier;

Pwall_multiplier = (1+((gamma-1)/2)*M_wall.^2).^(gamma/(gamma-1));
P_static_wall     = P0 ./ Pwall_multiplier;


% %% Calculate static pressure on nozzle wall
% T_multiplier = zeros(size(M_wall));
% T = zeros(size(M_wall));
% a = zeros(size(M_wall));
% u = zeros(size(M_wall));
% Pwall_multiplier = zeros(size(M_wall));
% rho = zeros(size(M_wall));
% P_static_wall = zeros(size(M_wall));
% 
%     for kk = 1:length(M_wall)
%         T_multiplier(kk) = (1+((gamma-1)/2)*M_wall(kk)^2);
%         T(kk) = T0/T_multiplier(kk);
%         a(kk) = sqrt(gamma*R*T(kk));
%         u(kk) = M_wall(kk)*a(kk);
% 
%         Pwall_multiplier(kk) = (1+((gamma-1)/2)*M_wall(kk)^2)^(gamma/(gamma-1));
%         P_wall(kk) = P0/Pwall_multiplier(kk);
%         
%         rho(kk) = P_wall(kk)/(R*T(kk));
% 
%         P_static_wall(kk) = P0 - 0.5*rho(kk)*u(kk)^2;
%     end

end


