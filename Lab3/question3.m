% Question 3
% Parameters constant throughout the problem:
Z_o = 75; % Ohms
v_p = 2e8; % m/s
l = 0.25; % m

% Frequency range
freq_v = linspace(1e6, 3e8, 300); % Hz
beta = 2*pi*freq_v/v_p; % Vector of the different phase constants
theta = 2*beta*l; % vector of theta values to be passed to the reflection coefficients

% Problem-specific parameters
Z_l = 15; % Ohms


%Initialize arrays refcoeff, and so on.
Gamma = refcoeff(Z_l/Z_o);
Gamma_p = zeros([1 length(freq_v)]);
zin = zeros([1 length(freq_v)]);

%calculate the corresponding values
for i=1:length(freq_v)
    Gamma_p(i) = rotrefcoeff(Gamma,theta(i));
    zin(i) = (1 + Gamma_p)/(1-Gamma_p);
end

% plot Gamma_p and z_in
s = smithplot(freq_v,Gamma_p);
hold on;
h = plot(freq_v,real(zin),freq_v,imag(zin));
hold on;

% Low vs. High Frequency?


% Since l = 0.25m and v_p = 2e8 m/s, we can perform a simple calculation
% which will show that the frequency at which the transmission line acts as
% a 1/4 wave transformer is 200MHz

% Since the angle is 90 degrees, we use the formula provided to get 2. 
% Using the direct approach, we get: l*3e8 Hz/v_p = 0.375

