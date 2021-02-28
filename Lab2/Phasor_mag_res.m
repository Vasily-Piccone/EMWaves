% Problem 2
% Phasor mag on a lossless line with resistive loads loads


%Constants
Z0 = 100;  % Ohms
Gammaa_a = 0;

Gammaa_b = 1/3;

Gammaa_c = 2/3;

Gammaa_d = 1;

gamma = 2*pi*1i;  % rad/m
V0 = 1; % Volts

z = linspace(-2,0,200);

% Define empty voltage and current arrays
[Vs_a, Is_a] = linephasor(V0,Gammaa_a,gamma,Z0,z);
[Vs_b, Is_b] = linephasor(V0,Gammaa_b,gamma,Z0,z);
[Vs_c, Is_c] = linephasor(V0,Gammaa_c,gamma,Z0,z);
[Vs_d, Is_d] = linephasor(V0,Gammaa_d,gamma,Z0,z);

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
plot(z,Vsa) 
plot(z,Isa)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 0')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sa))
text(-1.5,0.4, 'ZL = 100 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_a))

figure
hold on
plot(z,Vsb) 
plot(z,Isb)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 1/3')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sb))
text(-1.5,0.4, 'ZL = 200 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_b))

figure
hold on
plot(z,Vsc) 
plot(z,Isc)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 2/3')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sc))
text(-1.5,0.4, 'ZL = 500 Ohms')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_c))

figure
hold on
plot(z,Vsd) 
plot(z,Isd)
yyaxis left
xlabel('z (m)')
ylabel('Voltage (V)')
yyaxis right
ylabel('Current (*100 A)')
grid on
title('Magnitude of Voltage and Current VS Position for Gamma = 1')
text(-1.5,0.5, sprintf('VSWR=%f' ,Sd))
text(-1.5,0.4, 'ZL -> Infinity')
text(-1.5,0.3, sprintf('Vs(z=0)/Is(z=0)=%f' ,Ratio_d))