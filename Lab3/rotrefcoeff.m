function [Gammarot] = rotrefcoeff(Gamma, theta)
    Gammarot = Gamma*exp(-j*theta);
end