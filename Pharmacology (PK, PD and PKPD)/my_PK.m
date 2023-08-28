% Define the parameters of the PK model
k_absorption = 0.5; % absorption rate constant (1/hour)
k_elimination = 0.25; % elimination rate constant (1/hour): excretion or elimination of the substance or the products of its metabolism
% Vd = 10; % volume of distribution (L)

% Define the time points at which the PK model will be evaluated (in hours)
t = 0:0.1:24; % time points (hours)

% Define the input function (the amount of drug administered at each time point)
dose = zeros(size(t)); % initialize the dose array
dose(t >= 0 & t < 12) = 50; % 50 mg administered over the first 12 hours
dose(t >= 12 & t < 24) = 100; % 100 mg administered over the next 12 hours

% Initialize the concentration array
concentration = zeros(size(t));

% Set the initial concentration
concentration(1) = 0;

% Loop through each time point and compute the concentration at that time point
for i = 2:length(t)
    % Compute the concentration at the current time point
    concentration(i) = concentration(i-1) + k_absorption * dose(i-1) - k_elimination * concentration(i-1);
end

% Plot the concentration versus time
plot(t, concentration);
xlabel('Time (hours)');
ylabel('Concentration (mg/L)');
% This code defines a PK model with an absorption rate constant of 0.5 1/hour and an elimination rate constant of 
% 0.25 1/hour. The volume of distribution is set to 10 L. The input function is defined as a series of doses 
% administered at specific time points. The PK model is then evaluated at a series of time points and the concentration 
% is computed using a simple first-order PK equation. Finally, the concentration versus time curve is plotted.