mu_0 = 4*pi*10^-7; %H/m
f = 10.^[3:0.05:log10(300e9)]

eps_array = zeros([1,length(f)]);
loss_tan = zeros([1,length(f)]);

for i=1:length(f)
    eps_array(i) = purewatereps(f(i));
    loss_tan(i) = -imag(purewatereps(f(i)))/real(purewatereps(f(i)));
end 

% plot for the \eps' and \eps''
figure;
semilogx(f,real(eps_array),f,-imag(eps_array));
title("Normalized \epsilon ' and \epsilon ''");

% plot for the loss tangent
figure; 
semilogx(f, loss_tan);
title("Logarithmic plot of tan(\delta_D)");

% calculating gamma, and A/l:
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

%calculating the lambda ratio
lambda_0 = 3e8*ones([1, length(f)]);
lambda_0 = lambda_0./f;

lambda = 2*pi*ones([1,length(f)]);
lambda = lambda./(imag(gamma));

norm_lambda = lambda./lambda_0;


%plotting norm_lambda
figure;
semilogx(f, norm_lambda);
title("normalized lambda vs. frequency (Hz)");


% To minimize attenuation, the frequency should be minimized. we see this
% as at high frequencies, the attenuation is high. 

% The A/l is approximately 3dB/m at approximately 5MHz

% @ 1GHz, the wavelength in pure water is much smaller than that in a
% vaccuum. In the microwave range, pure water shortens the wavelength.

