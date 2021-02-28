function eps_norm_salt_H2O = seawatereps(freq)

    epsilon_fs = 8.854e-12; % F/m
    sigma = 4; % S/m
    eps_norm_salt_H2O = purewatereps(freq) + (sigma/epsilon_fs)/(1i*2*pi*freq);
    
end 