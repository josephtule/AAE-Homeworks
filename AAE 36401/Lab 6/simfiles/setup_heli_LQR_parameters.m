% SETUP_LAB_HELI_2D
%
% 2 DOF Helicopter (2DHELI) Control Lab: 
% Design of a FF+LQR+I position controller
% 
% SETUP_LAB_HELI_2D sets the model parameters and set the controller
% parameters for the Quanser 2DOF Helicopter system.
%
% Copyright (C) 2005 Quanser Consulting Inc.
% Quanser Consulting Inc.
%
clear all;
%
% ############### USER-DEFINED 2DOF HELI CONFIGURATION ###############
% Cable Gain used for yaw and pitch axes.
K_CABLE_P = 5;
K_CABLE_Y = 3;
% UPM Maximum Output Voltage (V): YAW has UPM-15-03 and PITCH has UPM-24-05
VMAX_UPM_P = 24;
VMAX_UPM_Y = 15;
% Digital-to-Analog Maximum Voltage (V): set to 10 for Q4/Q8 cards
VMAX_DAC = 10;
% Pitch and Yaw Axis Encoder Resolution (rad/count)
K_EC_P = - 2 * pi / ( 4 * 1024 );
K_EC_Y = 2 * pi / ( 8 * 1024 );
% Initial Angle of Pitch (rad)
theta_0 = -30*pi/180;
%
% ############### END OF USER-DEFINED DOF HELI CONFIGURATION ###############
%
%
% ############### USER-DEFINED CONTROLLER/FILTER DESIGN ###############
% Anti-windup: integrator saturation (V)
SAT_INT_ERR_PITCH = 20;
SAT_INT_ERR_YAW = 20;
% Anti-windup: integrator reset time (s)
Tr_p = 1;
Tr_y = 1;
%
% Type of Controller: set it to 'LQR_AUTO' or 'MANUAL'  
CONTROLLER_TYPE = 'LQR_AUTO';    % LQR controller design: automatic mode
%CONTROLLER_TYPE = 'MANUAL';    % controller design: manual mode
%
% Specifications of a second-order low-pass filter
wcf = 2 * pi * 20; % filter cutting frequency
zetaf = 0.85;        % filter damping ratio
% ############### END OF USER-DEFINED CONTROLLER DESIGN ###############
%
% ############### USER-DEFINED JOYSTICK SETTINGS ###############
% Joystick input X sensitivity used for yaw (deg/s/V)
K_JOYSTICK_X = 85;
% Joystick input Y sensitivity used for pitch (deg/s/V)
K_JOYSTICK_Y = 85;
% Joystick input X sensitivity used for yaw (V/s/V)
K_JOYSTICK_V_X = 10;
% Joystick input Y sensitivity used for pitch (V/s/V)
K_JOYSTICK_V_Y = 5;
% Pitch integrator saturation of joystick (deg)
INT_JOYSTICK_SAT_LOWER = theta_0 * 180 / pi;
INT_JOYSTICK_SAT_UPPER = abs(theta_0)  * 180 / pi;
% Deadzone of joystick: set input ranging from -DZ to +DZ to 0 (V)
JOYSTICK_X_DZ = 0.25;
JOYSTICK_Y_DZ = 0.25;
% ############### END OF USER-DEFINED JOYSTICK SETTINGS ###############
%
% Set the model parameters of the 2DOF HELI.
% These parameters are used for model representation and controller design.

% OVERIDING QUANSER PARAMETERS WITH OUR PARAMETERS
K_pp   = 0.185*0.20962;   %N/V
K_yy   = 0.185*0.050271;  %N/V
K_yp   = 0.0083316; %N-m/V
K_py   = 0.0041362; %N-m/V
J_eq_p = 0.0500;        %kg-m^2
J_eq_y = 0.0500+0.0039; %kg-m^2
B_p    = 0.0100000; %kg-m^2/s
B_y    = 0.0071428; %kg-m^2/s
m_heli = 1.326;     %kg
l_cm   = 0.0168;    %m 
h      = 0.0139;    %m
Rc     = 0.0094;    %m
g      = 9.81;      %m/s^2;
Vpe    = 9;         %V
Vye    =-9;         %V

% For the following state vector: X = [ theta; psi; theta_dot; psi_dot]
% Initialization the state-Space representation of the open-loop System
HELI_2D_ABCD_eqns;
a=[ A(1,:) 0 0;
    A(2,:) 0 0;
    A(3,:) 0 0;
    A(4,:) 0 0;
    1 0 0 0 0 0;
    0 1 0 0 0 0 ];
b = [B;0 0;0 0];