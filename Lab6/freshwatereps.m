function eps_norm_fresh_H2O = freshwatereps(freq)

    epsilon_fs = 8.854e-12; % F/m
    sigma = 0.02; % S/m
    eps_norm_fresh_H2O = purewatereps(freq) + (sigma/epsilon_fs)/(1i*2*pi*freq);
    
end 