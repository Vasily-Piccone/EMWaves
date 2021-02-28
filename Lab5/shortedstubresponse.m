%Write a function that calculates the reflection coefficient 
%for a single stub circuit with lengths l and d, normalized
%load impedance zL, and phase constant β

function [ Gamma ]= shortedstubresponse(l,d,zL,beta)

%Normalized load admittance

%Load reflection coefficient ΓL

%angle of GammaL

%Rotated load reflection coefficient Γ’L

%Admittance yA towards the load
yA = (1+1i*zL*tan(beta*d))/(zL+1i*tan(beta*d));

%Admittance yS towards the short
yS = 1/(1i*tan(beta*l));

%Total admittance yin = yA + yS
yin = yA + yS;

%Reflection coefficient Γ
Gamma = (1-yin)/(yin +1);
end