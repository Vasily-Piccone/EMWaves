mu_0 = 4*pi*10^(-7)
f = 10.^[3:0.05:log10(300e9)];

for i=1:length(f)
    eps_array(i) = freshwatereps(f(i));
    loss_tan(i) = -imag(freshwatereps(f(i)))/real(freshwatereps(f(i)));
end  

% calculating gamma, alpha and Aoverl
gamma = 1i*2*pi*f.*sqrt(eps_array*mu_0);
alpha = real(gamma);
Aoverl = 8.69*alpha;

% Plot for gamma 
figure;
semilogx(f, gamma);
title("Logarithmic plot of \gamma (Np/m) vs. frequency (Hz)");

% Plot for A/l
figure;
loglog(f, Aoverl);
title("Logarithmic plot of A/l (dB/m) vs. frequency (Hz)");

% It was observed that the attenuation is consistently smaller in the fresh
% water. The implications of this are that the initial power of the wave to
% be transmitted must be far higher in salt water than in fresh water.
