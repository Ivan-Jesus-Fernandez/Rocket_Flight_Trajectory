clc;clear all;close all;
% Define initial conditions
t0 = -10; % Initial time (seconds)
tf = 50; % Final time (seconds)
dt = 1; % Time step (seconds)
initial_height = 0; % Initial height (meters)
initial_velocity = 0; % Initial velocity (m/s)

% Initialize arrays
time = t0:dt:tf;
height = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

% Calculate height, velocity, and acceleration at each time step
for i = 1:length(time)
    t = time(i);
    
    if t < 0
        acceleration(i) = -GetConstAcceleration(t);
    else
        acceleration(i) = GetConstAcceleration(t);
    end
    
    if i == 1
        velocity(i) = initial_velocity + acceleration(i) * dt;
        height(i) = initial_height + velocity(i) * dt;
    else
        velocity(i) = velocity(i-1) + acceleration(i) * dt;
        height(i) = height(i-1) + velocity(i) * dt;
    end
end

% Plot the graphs
figure;

subplot(3,1,1);
plot(time, height, 'b');
title('Height vs. Time');
xlabel('Time (s)');
ylabel('Height (m)');
grid on;

subplot(3,1,2);
plot(time, velocity, 'g');
title('Velocity vs. Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on;

subplot(3,1,3);
plot(time, acceleration, 'r');
title('Acceleration vs. Time');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
grid on;
