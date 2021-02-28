% Problem 4
% Phasor mag on a lossy line with matched load


%Constants
Z0 = 100;  % Ohms
V0 = 1; % Volts

Gammaa_a = 0;
Gammaa_b = 0;
Gammaa_c = 0;
Gammaa_d = 0;

gamma_a = -0.05 - 2*pi*1i;
gamma_b = -0.347 - 2*pi*1i;
gamma_c = -0.693 - 2*pi*1i;
gamma_d = -2 - 2*pi*1i;
z = linspace(-2,0,200);

% Define empty voltage and current arrays
[Vs_a, Is_a] = linephasor(V0,Gammaa_a,gamma_a,Z0,z);
[Vs_b, Is_b] = linephasor(V0,Gammaa_b,gamma_b,Z0,z);
[Vs_c, Is_c] = linephasor(V0,Gammaa_c,gamma_c,Z0,z);
[Vs_d, Is_d] = linephasor(V0,Gammaa_d,gamma_d,Z0,z);

% magnitude of phasors
Vsa = abs(Vs_a);
Sa = max(Vsa)/min(Vsa);
Isa = 100*abs(Is_a);
Ratio_a = Vs_a(length(z))/Is_a(length(z));

Vsb = abs(Vs_b);
Sb = max(Vsb)/min(Vsb);
Isb = 100*abs(Is_b);
Ratio_b = Vs_b(length(z))/Is_b(length(z));

Vsc = abs(Vs_c);
Sc = max(Vsc)/min(Vsc);
Isc = 100*abs(Is_c);
Ratio_c = Vs_c(length(z))/Is_c(length(z));

Vsd = abs(Vs_d);
Sd = max(Vsd)/min(Vsd);
Isd = 100*abs(Is_d);
Ratio_d = Vs_d(length(z))/Is_d(length(z));

%Plotting the phasor magnitude:
figure
hold on
plot(z,Vsa,'color',[0.9    0.7    0.1], 'linewidth', 3') 
plot(z,Isa, 'k.')
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 0.05 + j2pi')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sa))
text(-1.5,0.4, 'ZL = Z0 = 100 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_a))
text(-1.5,0.2, 'Reflection coefficient = 0')

figure
hold on
plot(z,Vsb, 'color',[0.9    0.7    0.1], 'linewidth', 3) 
plot(z,Isb, 'k.')
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 0.347 + j2pi')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sb))
text(-1.5,0.4, 'ZL = Z0 = 100 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_b))
text(-1.5,0.2, 'Reflection coefficient = 0')

figure
hold on
plot(z,Vsc, 'color',[0.9    0.7    0.1], 'linewidth', 3) 
plot(z,Isc, 'k.')
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 0.693 + j2pi')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sc))
text(-1.5,0.4, 'ZL = Z0 = 100 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_c))
text(-1.5,0.2, 'Reflection coefficient = 0')

figure
hold on
plot(z,Vsd,'color',[0.9    0.7    0.1], 'linewidth', 3) 
plot(z,Isd, 'k.')
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 2 + j2pi')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sd))
text(-1.5,0.4, 'ZL = Z0 = 100 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_d))
text(-1.5,0.2, 'Reflection coefficient = 0')