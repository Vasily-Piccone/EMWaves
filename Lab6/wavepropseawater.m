% constants 
mu_0 = 4*pi*10^(-7)
f = 10.^[3:0.05:log10(300e9)];

for i=1:length(f)
    eps_array(i) = seawatereps(f(i));
    loss_tan(i) = -imag(seawatereps(f(i)))/real(seawatereps(f(i)));
end  

% plot the real and imaginary components of the \eps_e
figure;
loglog(f,real(eps_array),f,-imag(eps_array));
title("Normalized \epsilon ' and \epsilon ''");

% plot for the loss tangent
figure; 
semilogx(f, loss_tan);
title("Logarithmic plot of tan(\delta_D)");


% e"/e_0 is inversely proportional to 1/f at low frequencies because at low
% frequencies, the first terms in the e(f)/e_0 expression are very small,
% and thus the final term dominates

% The approximate range is from 1KHz to roughly 2GHz

%for gamma, A/l and norm_lambda
gamma = 1i*2*pi*f.*sqrt(eps_array*mu_0);
alpha = real(gamma);
Aoverl = 8.69*alpha;

lambda_0 = 3e8*ones([1, length(f)]);
lambda_0 = lambda_0./f;

lambda = 2*pi*ones([1,length(f)]);
lambda = lambda./(imag(gamma));

norm_lambda = lambda./lambda_0;

% Plots 

% Plot for gamma 
figure;
semilogx(f, gamma);
title("Logarithmic plot of \gamma (Np/m) vs. frequency (Hz)");

% Plot for A/l
figure;
loglog(f, Aoverl);
title("Logarithmic plot of A/l (dB/m) vs. frequency (Hz)");

%plotting norm_lambda
figure;
semilogx(f, norm_lambda);
title("normalized lambda vs. frequency (Hz)");

% For minimum attenuation, one should again choose the smaller frequency
% wave.

% THere is no frequency for which the mangitude of A/l is 3dB/m.

% the saltwater medium has a greater attenuation per unit length initially,
% but at higher frequencies, the attenuation becomes similar. We can also
% find these frequencies from the graphs.


% the wavelength of at 1kHz in the sea water is:
l = lambda(1)

% 14.8mm, while in free space, the wavelength is: 

l_fs = lambda_0(1)
 
% 300 km



