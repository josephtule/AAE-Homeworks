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
[ K_pp, K_yy, K_yp, K_py, J_eq_p, J_eq_y, B_p, B_y, m_heli, l_cm, g] = setup_heli_2d_configuration();



% OVERIDING QUANSER PARAMETERS WITH OUR PARAMETERS
K_pp   = 0.185*0.20962;   %N/V
K_yy   = 0.185*0.050271;  %N/V
K_yp   = 0.0083316; %N-m/V
K_py   = 0.0041362; %N-m/V
J_eq_p = 0.0500;    %kg-m^2
J_eq_y = 0.0500+0.0039;    %kg-m^2
B_p    = 0.0100000;        %kg-m^2/s
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
%
if strcmp ( CONTROLLER_TYPE, 'LQR_AUTO' )
    % Feed-forward gain adjustment (V/V)
    K_ff = 1;
    % LQR Controller Design Specifications
    % Q = diag([1 1 0.5 0.5]);
    % R = 0.005*eye(2,2);
    Q = diag([200 200 100 100]);
    R = eye(2,2);
    % Automatically calculate the LQR controller gain
    [ K ] = d_heli_2d_lqr( A, B, C, D, Q, R );    
    % Display the calculated gains
%     disp( ' ' )
%     disp( 'Calculated LQR controller gain elements: ' )
%     disp( [ 'K = [' num2str( K(1,1),3 ) ' V/rad  '  num2str( K(1,2),3 ) ' V/rad  ' num2str( K(1,3),3 ) ' V.s/rad  '  num2str( K(1,4),3 ) ' V.s/rad]'] )
%     disp( [ '    [' num2str( K(2,1),3 ) ' V/rad  '  num2str( K(2,2),3 ) ' V/rad  ' num2str( K(2,3),3 ) ' V.s/rad  '  num2str( K(2,4),3 ) ' V.s/rad]'] )
    %
    % LQR+I Controller Design Specifications
    Qi = diag([Q(1,1) 0.75*Q(2,2) Q(3,3) 2*Q(4,4) 50 50 ]); 
    % Automatically calculate the LQR controller gain
    [ Ki ] = d_heli_2d_lqr_i( A, B, C, D, Qi, R );    
    % Display the calculated gains
%     disp( ' ' )
%     disp( 'Calculated LQR+I controller gain elements: ' )
%     disp( [ 'Ki = [' num2str( Ki(1,1),3 ) ' V/rad  '  num2str( Ki(1,2),3 ) ' V/rad  ' num2str( Ki(1,3),3 ) ' V.s/rad  '  num2str( Ki(1,4),3 ) ' V.s/rad ' num2str( Ki(1,5),3 ) ' V/(rad.s) ' num2str( Ki(1,6),3 ) ' V/(rad.s)]'] )
%     disp( [ '    [' num2str( Ki(2,1),3 ) ' V/rad  '  num2str( Ki(2,2),3 ) ' V/rad  ' num2str( Ki(2,3),3 ) ' V.s/rad  '  num2str( Ki(2,4),3 ) ' V.s/rad ' num2str( Ki(2,5),3 ) ' V/(rad.s) ' num2str( Ki(2,6),3 ) ' V/(rad.s)]' ] )    
elseif strcmp ( CONTROLLER_TYPE, 'MANUAL' )
    disp( [ 'K = [' 0 ' V/rad  '  0 ' V/rad  ' 0 ' V.s/rad  '  0 ' V.s/rad]'] )
    disp( ' ' )
    disp( 'STATUS: manual mode' ) 
    disp( 'The model parameters of your Single Pendulum and IP01 or IP02 system have been set.' )
    disp( 'You can now design your state-feedback position controller.' )
    disp( ' ' )
else
    error( 'Error: Please set the type of controller that you wish to implement.' )
end
a=[ A(1,:) 0 0;
    A(2,:) 0 0;
    A(3,:) 0 0;
    A(4,:) 0 0;
    1 0 0 0 0 0;
    0 1 0 0 0 0 ];
b = [B;0 0;0 0];
Q = diag([200 200 100 100]);
R = eye(2,2);
Qi = diag([Q(1,1) 0.75*Q(2,2) Q(3,3) 2*Q(4,4) 50 50 ]); 
Ki = lqr(a,b,Qi,R);

% gp=tf(B(3,1),[1,-A(3,3),-A(3,1)]);
% gy=tf(B(4,2),[1,-A(4,4),-A(4,2)]);
%For Mario 
% Ki = [22.2484, 0, 0.1836, 0 ,7.8369 ,0;0,10.0181,0,0.1038,0,1];
% The poles for the PID feedback of gp are 
% [-4.6661 + 5.2307i,-4.6661 - 5.2307i,-0.3775]. 
% In this case, wn = 7.0095 and zeta = 0.6657 while alpha =2 and beta =1. So Ki = 2/gp(0) = 7.8369;
% The poles for the PID feedback of gy are 
% [-1.7365 + 2.1327i,-1.7365 - 2.1327i,-0.1046]. 
% In this case, wn = 2.7502 and zeta = 0.6314 while  ki =1. 
%
%
%For pole placement
%  p = poly([-1,-2,-3]); 
%  k=B(3,1);kd=(p(2)+A(3,3))/k;kp=(p(3)+A(3,1))/k;ki=p(4)/k;
%  p = poly([-1/2,-1+i,-1-i]);
%  k=B(4,2);kd2=(p(2)+A(4,4))/k;kp2=(p(3)+A(4,2))/k;ki2=p(4)/k;
%  Ki=[kp,0,kd,0,ki,0;0,kp2,0,kd2,0,ki2] 
%
%
% Now let us choose ki first
% For gp choose wn =6 and zeta = 0.7;
%  ki=-2*A(3,1)/B(3,1);lam=-.7*6+i*6*sqrt(1-.7^2);
%  z=B(3,1)/(lam^2-A(3,3)*lam -A(3,1));
%  x=-inv([lam^2*z,lam*z;conj([lam^2*z,lam*z])])*[lam+ki*z;conj(lam+ki*z)];
%  kd=real(x(1));kp=real(x(2));
% %For gy choolse wn= 2 and zeta =0.7
%  ki2=1;lam=-.7*2+i*2*sqrt(1-.7^2);z=B(4,1)/(lam^2-A(4,4)*lam -A(4,2));
%  x=-inv([lam^2*z,lam*z;conj([lam^2*z,lam*z])])*[lam+ki*z;conj(lam+ki*z)];
%  kd2=real(x(1));kp2=real(x(2)); 
%  Ki=[kp,0,kd,0,ki,0;0,kp2,0,kd2,0,ki2]  

