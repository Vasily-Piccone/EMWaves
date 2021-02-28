function [zin] = inputZ(Gamma, theta)
    zin = (1 + Gamma*exp(-j*theta)/(1 - Gamma*exp(-j*theta)));
end