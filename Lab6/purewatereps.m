function eps_norm_H2O = purewatereps(freq)
% Defining constants. These are true at T = 25 C
    eps_inf = 5.2; %F/m?
    eps_0 = 78.3; % F/m?
    tau = 8.3e-12; %s
    
 % The result to be returned
    eps_norm_H2O = (eps_inf +(eps_0-eps_inf)/(1+1i*2*pi*freq*tau));
end

