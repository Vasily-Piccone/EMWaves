%  Question 2 
% Constants for all questions:
Zo = 75; % Ohms
R = 75; % Ohms
v_p = 2e8; % m/s
l = 0.25; % m 
f = 1e6; % Hz


%  a)
C_1 = 1^(-10);
Z_L1 = zeros([300 1]);

for i=1:(length(Z_L1))
    % increases the frequency with every interval by 1 MHz
    omega = 2*pi*f*i;
    Z_L1(i) = R + 1/(j*omega*C_1);
end
zL1 = Z_L1/Zo; % Normalizing the impedance

% Define the reflection coefficient
Gamma_1 = refcoeff(zL1)
