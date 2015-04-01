%% data input
% plots of flight parameters

% Orbiter position and attitude
x = Position.data(:,1);     % latitude,[deg]
y = Position.data(:,2);     % longitue,[deg]
z = Position.data(:,3);     % altitude,[m]
roll  = Position.data(:,4); % roll angle, [deg]
pitch = Position.data(:,5); % pitch angle,[deg]
yaw   = Position.data(:,6); % yaw angle,  [deg]
timePos = Position.time;

% Controls deflection from FG [deg], elevator and aileron scaled
bodyflap_fg = Controls_FG.BodyFlap.data;
elevator_fg = Controls_FG.Elevator.data;
ailerons_fg = Controls_FG.Aileron.data;
rudder_fg   = Controls_FG.Rudder.data;
SpeedBrake_fg = Controls_FG.Speedbrake.data;
timeCtr = Controls_FG.Elevator.time;

% Controls deflection commands [deg]
bodyflap_cmd = Controls_cmd.Body_Flap.data;
elevator_cmd = Controls_cmd.DELEC.data;
ailerons_cmd = Controls_cmd.DALEC.data;
rudder_cmd   = Controls_cmd.Rudder.data;
SpeedBrake_cmd = Controls_cmd.Speed_brake_cmd.data;
timeCMD = Controls_cmd.DELEC.time;

% Flight parameters
Alpha = FlightParam.Alpha.data; % [deg]
Beta =  FlightParam.Beta.data; % [deg]
Alpha_dot = FlightParam.Alpha_dot.data; % [deg/s]
Beta_dot = FlightParam.Beta_dot.data; %[deg/s]
Airspeed = FlightParam.Airspeed.data; % [m/s]
DynamicPressure = FlightParam.dyn_pressure.data; % [Pa]
Mach = FlightParam.Mach.data; 
timeFP = FlightParam.Alpha.time; %[s]

%% plots
% Euler angles
figure(1)
subplot(3,1,1)
hold on
plot(timePos, roll);
legend('roll','roll2');
subplot(3,1,2)
hold on
plot(timePos, pitch);
legend('pitch','pitch2');
subplot(3,1,3)
hold on
plot(timePos, yaw);
legend('yaw','yaw2');

% plot 3D trajectory
figure(2)
hold on
plot3(x,y,z,'LineWidth' ,2)
xlabel('latitude,  [deg]');
ylabel('longitude, [deg]');
zlabel('altitude,  [m]');
grid on
axis square

%% control surfaces
figure(3)
title('control surfaces deflection');
subplot(4,1,1)
hold on
plot(timeCtr, ailerons_fg);
plot(timeCMD, ailerons_cmd,'r');
legend('ailerons_f_g [deg]','ailerons_c_m_d [deg]');
subplot(4,1,2)
hold on
plot(timeCtr, elevator_fg);
plot(timeCMD, elevator_cmd,'r');
legend('elevator_f_g [deg]', 'elevator_c_m_d [deg]');
subplot(4,1,3)
hold on
plot(timeCtr, bodyflap_fg);
plot(timeCMD, bodyflap_cmd,'r');
legend('bodyflap_f_g [deg]','bodyflap_c_m_d [deg]');
subplot(4,1,4)
hold on
plot(timeCtr, rudder_fg);
plot(timeCMD, rudder_cmd,'r');
legend('rudder_f_g [deg]','rudder_c_m_d [deg]');

%% Flight Paramenters
figure(4)
subplot(6,1,1)
hold on
plot(timeCtr, elevator_fg);
plot(timeCMD, elevator_cmd,'r');
legend('elevator_f_g', 'elevator_c_m_d');
ylabel('[deg]')
subplot(6,1,2)
hold on
plot(timeCtr, bodyflap_fg);
plot(timeCMD, bodyflap_cmd,'r');
legend('bodyflap_f_g','bodyflap_c_m_d');
ylabel('[deg]')
subplot(6,1,3)
hold on
plot(timeFP, Alpha);
legend('Angle of attack');
ylabel('[deg]')
subplot(6,1,4)
hold on
plot(timePos, pitch);
legend('pitch');
ylabel('[deg]')
subplot(6,1,5)
hold on
plot(timeFP, Airspeed);
plot([0 timeFP(end)],[105 105],'-.r');
plot([0 timeFP(end)],[88 88] ,'--g');  
ylabel('[m/s]')
legend('Airspeed [m/s]','maximal','nominal');
subplot(6,1,6)
hold on
plot(timePos,z);
legend('altitude')
xlabel('time, [msec]')
ylabel('[m]')

%% Euler angles vs conrols
figure(5)
subplot(2,1,1)
hold on
plot(timeCtr, elevator_fg, 'r');
plot(timePos, pitch, 'b')
legend('elevator', 'pitch');
subplot(2,1,2)
hold on
plot(timeCtr, ailerons_fg, 'r');
plot(timePos, roll, 'b')
legend('ailerons', 'roll');
xlabel('time, [msec]')