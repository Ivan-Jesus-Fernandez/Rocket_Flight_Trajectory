clc;clear all;close all;
% Define initial conditions
t0 = 0; % Initial time (seconds)
tf = 50; % Final time (seconds)
dt = 1; % Time step (seconds)
initial_displacement = 0; % Initial horizontal displacement (meters)
initial_velocity = 0; % Initial velocity (m/s)
speed_of_sound = 343; % Speed of sound (m/s)

% Initialize arrays
time = t0:dt:tf;
displacement = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

% Calculate displacement, velocity, and acceleration at each time step
for i = 1:length(time)
    t = time(i);
    
    acceleration(i) = GetHAcceleration(t);
    
    if i == 1
        velocity(i) = initial_velocity + acceleration(i) * dt;
        displacement(i) = initial_displacement + velocity(i) * dt;
    else
        velocity(i) = velocity(i-1) + acceleration(i) * dt;
        displacement(i) = displacement(i-1) + velocity(i) * dt;
    end
    
    % Check if rocket exceeds speed of sound
    if velocity(i) > speed_of_sound
        fprintf('Rocket exceeds the speed of sound at t = %.2f seconds.\n', t);
        break;
    end
end

% Plot the horizontal displacement graph
figure;
plot(time, displacement, 'b');
title('Horizontal Displacement vs. Time');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on;


function acceleration = GetHAcceleration(t)
    % Define constant horizontal acceleration value here
    acceleration = 9.8; % m/s^2
end