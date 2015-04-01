%% Shuttle Orbiter Fligt Dynamics Model
% --------------------------------------------------------------
%     Diploma Master Thesis
%     by Sokolov Alexandr
%     Under supervision of Maciej Zasuwa, PhD
% 
%     Faculty of Power and Aeronautical Engineering
%     Warsaw University of Technology / Politechnika Warszawska
%     June, 2014
% ---------------------------------------------------------------
%% Initial data import 

% coordinates from FlightGear
% dms_FG = [37 40 57.1; -122 31 16.9];
% LL_initial = dms2degrees(dms_FG);
initial_dms = [37 40 45.3; -122 30 48.7]; % Initial position / offset 12 km from runway
initial_deg = dms2degrees(initial_dms);
LongLat0 = [initial_deg(2); initial_deg(1)]; % Initial pos in geodetic lat, lon, alt [mu,l,h], deg
h_Initial = 3187+0; %3024; % Initial altitude, [m]  => 12000 [m] dist-s to runway
heading0 = 117.5; % [deg] 
pm_0 = [0 0 0]; % Initial body rotation rates [pqr], [rad/s]

delta = 3; % 1.94; % AoA - incidence, [deg]
GlideSlopeInitial = -20;  % initial glideslope = pitch angle, % [deg]
Euler = [0 GlideSlopeInitial 0+heading0]*pi/180; % initial Euler angles, [rad]
Airspeed = 300; % Airspeed, [m/s]  
%Uvw = [300 0 0]; %
Uvw = [Airspeed*cosd(-delta) 0 -Airspeed*sind(-delta)]; %Initial velocities in body axes, [U,v,w] [m/s]

% Shuttle spec 
    % Moments and products of inertia, % [kg*m^2]:
    Ixx = 1169236;
    Iyy = 8729397;
    Izz = 8991771;
    Ixy = 3868;
    Ixz = -218615;
    Iyz = 3441;

% Symmetrical case along the longitudinal plane
    Inertia = [Ixx  0   Ixz
                0  Iyy  0
               Ixz  0  Izz];
    InertiaVector = [Ixx, Iyy, Izz]; %  [kg*m^2]
    mass = 83000; % kg with payload

% Nominal center-of-gravity offsets:
    CG = [1080.0 0.0 370.0]; % real CG from tables
    CP = [1080.0 0.0 370.0]; % CP = CG

% Geometry
    c = 12.06; % Mean aerodynamic chord, [m]
    b = 23.79; % Wing span, [m]
    S = 249.91; %Wing reference area, [m^2]
disp('Initial parameters loaded');    

% Load Aerodynamics
Aerodynamics
    
% coord ref point of airport KSFO runway 10L
runway_dms_FG = [37 37 43.4 ; -122 23 36.0]; 
runway_deg = dms2degrees(runway_dms_FG); % intup for simulink
runway_alt = 1;
   
% GlideSlope
    tr = matfile('GlideSlope.mat');
    GligeSlope = tr.trajectory_Orbiter;
    XglideOrbiter = GligeSlope(:,1);
    HglideOrbiter = GligeSlope(:,2);

glideslope_offset = 500; % [m]
Aimpoint = 500+193; % [m]

% simulator
Tc = 1/25; % time sample
H1 = 1*Tc;
TimeSample = 1/25; % Frequency of execution =  25 Hz

%   Run simulink model
uiopen('Shuttle_Orbiter_FDM.slx',1)
disp('Shuttle_Orbiter_FDM loaded');
