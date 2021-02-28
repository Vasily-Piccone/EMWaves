% Problem 3
% Phasor mag on a lossless line with inductive loads


%Constants
Z0 = 100;  % Ohms
Gammaa_e = exp(1i*pi/4);

Gammaa_f = exp(1i*2*pi/4);

Gammaa_g = exp(1i*3*pi/4);

Gammaa_h = exp(1i*4*pi/4);

gamma = 2*pi*1i;  % rad/m
V0 = 1; % Volts

z = linspace(-2,0,200);

% Define empty voltage and current arrays
[Vs_e, Is_e] = linephasor(V0,Gammaa_e,gamma,Z0,z);
[Vs_f, Is_f] = linephasor(V0,Gammaa_f,gamma,Z0,z);
[Vs_g, Is_g] = linephasor(V0,Gammaa_g,gamma,Z0,z);
[Vs_h, Is_h] = linephasor(V0,Gammaa_h,gamma,Z0,z);

% magnitude of phasors
Vse = abs(Vs_e);
Se = max(Vse)/min(Vse);
Ise = 100*abs(Is_e);
Ratio_e = Vs_e(length(z))/Is_e(length(z));

Vsf = abs(Vs_f);
Sf = max(Vsf)/min(Vsf);
Isf = 100*abs(Is_f);
Ratio_f = Vs_f(length(z))/Is_f(length(z));

Vsg = abs(Vs_g);
Sg = max(Vsg)/min(Vsg);
Isg = 100*abs(Is_g);
Ratio_g = Vs_g(length(z))/Is_g(length(z));

Vsh = abs(Vs_h);
Sh = max(Vsh)/min(Vsh);
Ish = 100*abs(Is_h);
Ratio_h = Vs_h(length(z))/Is_h(length(z));

%Plotting the phasor magnitude:
figure
hold on
plot(z,Vse) 
plot(z,Ise)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = exp(j*pi/4)')
text(-1.5,0.5, sprintf('VSWR=%f' ,Se))
text(-1.5,0.4, 'ZL = 240j Ohms')
text(-1.5,0.3, 'Vs(z=0)/Is(z=0) = 0 + j2.4142')

figure
hold on
plot(z,Vsf) 
plot(z,Isf)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = exp(j*2pi/4)')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sf))
text(-1.5,0.4, 'ZL = 100j Ohms')
text(-1.5,0.3, 'Vs(z=0)/Is(z=0) = 0 + j1')

figure
hold on
plot(z,Vsg) 
plot(z,Isg)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = exp(j*3pi/4)')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sg))
text(-1.5,0.4, 'ZL = 41j Ohms')
text(-1.5,0.3, 'Vs(z=0)/Is(z=0) = 0 + j41.42')

figure
hold on
plot(z,Vsh) 
plot(z,Ish)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = exp(j*4pi/4)')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sh))
text(-1.5,0.4, 'ZL = 0 Ohms')
text(-1.5,0.3, 'Vs(z=0)/Is(z=0) = 0 + j0')