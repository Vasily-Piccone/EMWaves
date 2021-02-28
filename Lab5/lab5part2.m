%lab5part2
vp = 2*10^(8);%phase velocity m/s

zL = 0.4;%normalized load impedance

fo = 1*10^9;%operating freq 1GHz

b = (2*pi*fo)/vp; %phase constant

%get l and d
[l, d] = shorted_stub_design(zL, b);

%f = 1Mhz to 2GHz delta = 1Mhz
f = linspace(1*10^6,2*10^9,2000);

%phase constant
pc = (2*pi*f)/vp;
gamma = zeros(length(f));
  for i = 1:length(f)
        gamma(i,:)= shortedstubresponse(l,d,zl,pc(i));
  end
  
  s = smithplot(f,gamma)
  figure;
  %Plotting the phasor magnitude:
  absgamma = abs(gamma);

    plot(f, absgamma,'b');
   
    xlabel('f [Hz]');
    ylabel('gamma');
    title('Magnitude of gamma'); legend('mag of gamma');
    %axis([-2 0 -0.2 2.2]);
