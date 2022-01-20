% clc
% clear all
% close all
addpath('data_F19')
%% AAE 575 Homework 3
% Andrew Kim

%% Problem 1

fL1 = 1.57542e9; %Hz
fL2 = 1.2276e9; %Hz
rawdata = load('rawdata.sv3');
orbits = load('orbit.sv3');
boulder = [-1288337.0539 -4721990.448 4078321.6617];
boulderLat = 39.9914;
boulderLong = 105.2610;
boulderHeight = 1657.7;
c = 299792458;

gps_time = rawdata(:,1);
rhoL1 = rawdata(:,2);
rhoL2 = rawdata(:,3);
carrierL1 = rawdata(:,4);
carrierL2 = rawdata(:,5);
dopplerL1 = rawdata(:,6);
dopplerL2 = rawdata(:,7);
orbit_time = orbits(:,1);
orbitX = orbits(:,2);
orbitY = orbits(:,3);
orbitZ = orbits(:,4);

alpha = (fL1^2)/(fL1^2 - fL2^2);

% ===================== 1.1 ========================== %
ionoFree = (fL1^2/(fL1^2 - fL2^2)) * rhoL1 - (fL2^2/(fL1^2 - fL2^2)) * rhoL2; % eq 5.31
ionoFreeRangeRate = differencingFunction(ionoFree, gps_time);

carrierPhase = (alpha * carrierL1 * (c/fL1)) - ((alpha - 1) * carrierL2 * (c/fL2));
carrierPhaseRate = differencingFunction(carrierPhase, gps_time);

rangeRateL1 = -(c/fL1) * dopplerL1;
rangeRateL2 = -(c/fL2) * dopplerL2;

trueRange = sqrt((orbitX - boulder(1)).^2 + (orbitY - boulder(2)).^2 + (orbitZ - boulder(3)).^2);
trueRangeRate = differencingFunction(trueRange, orbit_time);

% ===================== 1.2 ========================== %
oscillatorL1 = dopplerL1(1:100) + trueRangeRate' ./ (c/fL1);
oscillatorL2 = dopplerL2(1:100) + trueRangeRate' ./ (c/fL2);

lineOfSightL1 = -oscillatorL1 .* (c/fL1);
lineOfSightL2 = -oscillatorL2 .* (c/fL2);

% ===================== 1.3 ========================== %
pseudoClockBias = (ionoFree - trueRange) ./ c;
pseudoClockRate = differencingFunction(pseudoClockBias, gps_time);
pCR1 = pseudoClockRate' .* -fL1;
pCR2 = pseudoClockRate' .* -fL2;

% ===================== 1.4 ========================== %
carrierClockBias = (carrierPhase - trueRange) ./ c;
carrierClockRate = differencingFunction(carrierClockBias, gps_time);
cCR1 = carrierClockRate' .* -fL1;
cCR2 = carrierClockRate' .* -fL2;

% ===================== 1.5 ========================== %
freqErr_Pseudo1 = - (ionoFreeRangeRate' ./ (c/fL1)) - dopplerL1(1:100);
freqErr_Pseudo2 = - (ionoFreeRangeRate' ./ (c/fL2)) - dopplerL2(1:100);

freqErr_Carrier1 = - (carrierPhaseRate' ./ (c/fL1)) - dopplerL1(1:100);
freqErr_Carrier2 = - (carrierPhaseRate' ./ (c/fL2)) - dopplerL2(1:100);

freqErr_Doppler1 = - (rangeRateL1(1:100) ./ (c/fL1)) - dopplerL1(1:100);
freqErr_Doppler2 = - (rangeRateL2(1:100) ./ (c/fL2)) - dopplerL2(1:100);

% ===================== Plots ======================== %
figure()
plot(gps_time,ionoFree, 'LineWidth', 2)
hold on
plot(gps_time, carrierPhase, 'LineWidth', 2)
plot(orbit_time, trueRange, 'LineWidth', 2)
xlabel("GPS Time [s]")
ylabel("Range [m]")
grid on
legend("IF Pseudorange", "Carrier Phase", "Geometric Range")
title("Ionosphere Free Ranges vs. GPS Time -- Andrew Kim")

figure()
plot(gps_time(1:100),ionoFreeRangeRate', 'LineWidth', 2)
hold on
plot(gps_time(1:100), carrierPhaseRate', 'LineWidth', 2)
plot(gps_time(1:100), rangeRateL1(1:100)', 'LineWidth', 2)
plot(orbit_time(1:100), trueRangeRate(1:100)', 'LineWidth', 2)
xlabel("GPS Time [s]")
ylabel("Range [m]")
grid on
legend("IF Pseudorange Rate", "Carrier Phase Rate", "Doppler Frequency Rate L1", "Geometric Range Rate")
title("Ionosphere Free Range Rates vs. GPS Time -- Andrew Kim")

figure()
plot(gps_time(1:100), lineOfSightL1, 'LineWidth', 2)
hold on
plot(gps_time(1:100), lineOfSightL2, 'LineWidth', 2)
grid on
xlabel("GPS Time [s]")
ylabel("Line of Sight [m/s]")
title("Line of Sight vs. GPS Time -- Andrew Kim")
legend("Line of Sight L1", "Line of Sight L2")

figure()
plot(gps_time(1:100), oscillatorL1, 'LineWidth', 2)
hold on
plot(gps_time(1:100), oscillatorL2, 'LineWidth', 2)
grid on
xlabel("GPS Time [s]")
ylabel("Line of Sight [m/s]")
title("Oscillators vs. GPS Time -- Andrew Kim")
legend("Oscillator 1", "Oscillator 2")

figure()
plot(gps_time(1:100), oscillatorL1, ':', 'LineWidth', 2)
hold on
plot(gps_time(1:100), oscillatorL2, ':', 'LineWidth', 2)
plot(gps_time(1:100), pCR1, '--', 'LineWidth', 2)
plot(gps_time(1:100), pCR2, '--', 'LineWidth', 2)
plot(gps_time(1:100), cCR1, 'LineWidth', 2)
plot(gps_time(1:100), cCR2, 'LineWidth', 2)
grid on
xlabel("GPS Time [s]")
ylabel("Receiver Clock Bias [Hz]")
title("Receiver Clock Bias Rate vs. GPS Time -- Andrew Kim")
legend("L1 Oscillator Bias", "L2 Oscillator Bias",...
    "L1 Pseudorange Clock Bias Rate", "L2 Pseudorange Clock Bias Rate",...
    "L1 Carrier Clock Bias Rate", "L2 Carrier Clock Bias Rate")

figure()
plot(gps_time(1:100), oscillatorL1, ':', 'LineWidth', 2)
hold on
plot(gps_time(1:100), oscillatorL2, ':', 'LineWidth', 2)
plot(gps_time(1:100), pseudoClockBias(1:100), '--', 'LineWidth', 2)
plot(gps_time(1:100), carrierClockBias(1:100), 'LineWidth', 2)
grid on
xlabel("GPS Time [s]")
ylabel("Receiver Clock Bias [Hz]")
title("Receiver Clock Bias vs. GPS Time -- Andrew Kim")
legend("L1 Oscillator Bias", "L2 Oscillator Bias",...
    "Pseudorange Clock Bias", ...
    "Carrier Clock Bias")

figure()
plot(gps_time(1:100), freqErr_Pseudo1, 'LineWidth', 2)
hold on
plot(gps_time(1:100), freqErr_Pseudo2, 'LineWidth', 2)
plot(gps_time(1:100), freqErr_Carrier1, 'LineWidth', 2)
plot(gps_time(1:100), freqErr_Carrier2, 'LineWidth', 2)
plot(gps_time(1:100), freqErr_Doppler1, 'LineWidth', 2)
plot(gps_time(1:100), freqErr_Doppler2, 'LineWidth', 2)
grid on
title("Frequency vs. GPS Time -- Andrew Kim")
xlabel("GPS Time [s]")
ylabel("Frequency [1/s]")
legend("L1 Pseudorange Error", "L2 Pseudorange Error",...
    "L1 Carrier Error", "L2 Carrier Error", ...
    "L1 Doppler Error", "L2 Doppler Error")

%% Problem 2 & 3

dualFreq = load('dualfreq.csv');

alphas = [0.028e-6 -0.007e-6 -0.119e-6 0.119e-6];
betas = [137e3 -49e3 -131e3 -262e3];

delTz = [];
A2 = 0;
A4 = 0;
gps_time = dualFreq(:,1);
EL = dualFreq(:,3) / 180; % semicircles
AZ = (pi/180) * dualFreq(:,2); % rad
psi = (0.0137./(EL + 0.11)) - 0.022;
lambdaR = -105.2610 / 180; % semicircles
phiR = 39.9914 / 180; % semicircles

phiI = phiR + (psi .* cos(AZ));

for i = 1:length(phiI)
    if phiI(i) > 0.416
        phiI(i) = 0.416;
    elseif phiI(i) < -0.416
        phiI(i) = -0.416;
    end
end

lambdaI = lambdaR + ((psi.*sin(AZ))./cos(phiI*pi));

phiM = phiI + 0.064.*cos((lambdaI - 1.617)*pi);

for i = 1:length(alphas)
    A2 = A2 + alphas(i) .* phiM.^(i - 1);
    A4 = A4 + betas(i) .* phiM.^(i - 1);
end

t = 43200 .* lambdaI + gps_time;
x = (2 * pi .* (t - 50400)) ./ A4;

delTz = 5e-9 + (A2 .* (1 - ((x.^2) / 2) + ((x.^4) / 24))) .* (abs(x) <= 1.57);

F = 1 + 16*(0.53 - EL).^3;
delTIONO = F .* delTz .* c;

rhoL1_3 = dualFreq(:,4);
rhoL2_3 = dualFreq(:,5);

ionoDelay = (fL2^2/(fL1^2 - fL2^2)) * (rhoL2_3 - rhoL1_3);

figure()
plot(gps_time, delTIONO)
grid on
title("Ionospheric Delay at L1 -- Andrew Kim")
xlabel("GPS Time [sec]")
ylabel("Ionospheric Delay [m]")
hold on
plot(gps_time, ionoDelay)
legend("Klobuchar Model", "L1 Group Delay", 'Location', 'northwest')

%% Problem 4

saas = load('DH010600.csv');
phi4 = 33.390; % deg
height = -33.75 / 1000; % km
P0 = saas(:,7); % mbar
T0 = saas(:,8) + 273.15; % K
RH = saas(:,9) / 100; % percentage from 0 to 1

e0 = 6.108*RH.*exp((17.15*T0 - 4684) ./ (T0 - 38.5));

Tzd = 0.0022777 .* (1 + 0.0026.*cosd(2*phi4) + (0.00028 * height)) .* P0;
Tzw = 0.0022777 .* ((1255./T0) + 0.05) .* e0;

hd = 40136 + 148.72.*(T0 - 273.16);
Hd = 77.6e-6*(P0./T0).*(hd/5);

Hw = 0.373*(e0./T0.^2).*(11000/5);

tropoTime = datetime(2000, saas(:,2), saas(:,3), saas(:,4), saas(:,5), saas(:,6));

figure()
plot(tropoTime, Tzd)
grid on
hold on
plot(tropoTime, Hd)
legend("Saastamoinen Model", "Hopfield Model", 'Location', 'northwest')
title("Dry Zenith Tropospheric Delay Comparison -- Andrew Kim")
xlabel("GPS Time [hh:mm:ss]")
ylabel("Zenith Tropospheric Delay [m]")

figure()
plot(tropoTime, Tzw)
grid on
hold on
plot(tropoTime, Hw)
title("Wet Zenith Tropospheric Delay Comparison -- Andrew Kim")
xlabel("GPS Time [hh:mm:ss]")
ylabel("Zenith Tropospheric Delay [m]")
legend("Saastamoinen Model", "Hopfield Model", 'Location', 'northwest')

figure()
plot(tropoTime, Tzw + Tzd)
hold on
plot(tropoTime, Hd + Hw)
grid on
legend("Saastamoinen Model", "Hopfield Model", 'Location', 'northwest')
title("Wet and Dry Zenith Tropospheric Delay Comparison -- Andrew Kim")
xlabel("GPS Time [hh:mm:ss]")
ylabel("Zenith Tropospheric Delay [m]")

%% Problem 5

E = [12 30 75];
flatEarth = [];
chao1 = [];
chaoD = [];
chaoW = [];
chao2 = [];

for i = 1:length(E)
    flatEarth = [flatEarth, 1./sind(E(i))];
    chao1 = [chao1 1./sqrt(1-(cosd(E(i))/1.001).^2)];
    chaoD = [chaoD 1./(sind(E(i)) + (0.00143./(tand(E(i)) + 0.0445)))];
    chaoW = [chaoW 1./(sind(E(i)) + (0.00035./(tand(E(i)) + 0.017)))];
end

chao2 = [chao2 chaoD + chaoW];

for i = 1:3
    figure()
    plot(tropoTime, (Hd + Hw).*flatEarth(i))
    hold on
    plot(tropoTime, (Tzd + Tzw).*flatEarth(i))
    plot(tropoTime, (Hd + Hw).*chao1(i))
    plot(tropoTime, (Tzd + Tzw).*chao1(i))
    plot(tropoTime, (Hd.*chaoD(i)) + (Hw.*chaoW(i)))
    plot(tropoTime, (Tzd.*chaoD(i)) + (Tzw.*chaoW(i)))
    grid on
    xlabel("GPS Time [hh:mm:ss]")
    ylabel("Zenith Tropospheric Delay [m]")
    title("Mapping Comparison at " + E(i) + "^\circ -- Andrew Kim")
    legend("Simple Flat Earth Hopfield", "Simple Flat Saastamoinen",...
        "Chao (Misra and Enge) Hopfield", "Chao (Misra and Enge) Saastamoinen",...
        "Chao Hopfield", "Chao Saastamoinen", 'Location', 'northwest')
end



function dxdt = differencingFunction(x,t)
    dxdt = diff(x)./diff(t);
end
