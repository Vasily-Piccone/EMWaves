function [GammaTE, GammaTM] = refcoeffs(eps1, eps2, mu1, mu2, freq, theta_i)
    %step 1, calculate etas
    eta1 = sqrt(mu1/eps1);
    eta2 = sqrt(mu2/eps2);
    
    %step 2, calculate gammas
    gamma1 = 1i*2*pi*freq*sqrt(mu1*eps1);
    gamma2 = 1i*2*pi*freq*sqrt(mu2*eps2);
    
    %step 3, calculate sin(theta_t)
    sin_t = (gamma1/gamma2)*sind(theta_i);
    
    %step 4
    cos_t = sqrt(1 - (sin_t)^2);
    cos_i = sqrt(1 - ((gamma2/gamma1)*sin_t)^2);
    
    GammaTE = (eta2*cos_i-eta1*cos_t)/(eta2*cos_i+eta1*cos_t);
    GammaTM = (eta2*cos_t-eta1*cos_i)/(eta2*cos_t+eta1*cos_i);
end