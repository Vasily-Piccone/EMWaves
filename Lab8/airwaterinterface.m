f = 475*10^(12); %Hz

mu_0 = 4*pi*10^(-7); %Vacuum permiability

%permiabilities
mu1 = mu_0;
mu2 = mu_0;

n_2 = 1.33; % Refractive index for water 

eps_0 = 8.854*10^(-12); % vacuum permittivity

%permittivities
eps1 = eps_0;
eps2 = eps_0*(n_2)^2; 

%setting up the data (angles are in degrees)
min_theta = 0;
max_theta = 90;
step = 0.1;

num_points = (max_theta - min_theta)/step;

coeffsGTE = zeros(1, num_points);
coeffsGTM = zeros(1, num_points);

theta = linspace(min_theta, max_theta, num_points);

for i=1:num_points
    [coeffsGTE(i), coeffsGTM(i)] = refcoeffs(eps1, eps2, mu1, mu2, f, theta(i));
end

s1 = smithplot(coeffsGTE);
add(s1,coeffsGTM);





