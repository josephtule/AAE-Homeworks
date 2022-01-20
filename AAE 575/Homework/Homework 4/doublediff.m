function [cdiff,pdiff] = doublediff(sat1A, sat2A, sat1B, sat2B,carrier)
% Finds the double difference for the Carrier Phase and the Pseudorange

if eq(carrier,'L1')
    p = 2; c = 4;
elseif eq(carrier,'L2')
    p = 3; c = 5;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Carrier Phase Double Difference
% Location A
phase1A = sat1A(:,c); % carrier phase for sat 1
phase2A = sat2A(:,c); % carrier phase for sat 2
% Location B
phase1B = sat1B(:,c); % carrier phase for sat 1
phase2B = sat2B(:,c); % carrier phase for sat 2

% Single Differences
sin_diff1 = phase1B - phase1A; 
sin_diff2 = phase2B - phase2A;

% Double Difference
cdiff = sin_diff2 - sin_diff1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pseudorange Double Difference
% Location A
prange1A = sat1A(:,p); % prange for sat 1
prange2A = sat2A(:,p); % prnage for sat 2

% Location B
prange1B = sat1B(:,p); % prange for sat 1
prange2B = sat2B(:,p); % prnage for sat 2

% Single Differences
sin_diff1 = prange1A - prange1B;
sin_diff2 = prange2A - prange2B;

% Double Difference
pdiff = sin_diff1 - sin_diff2;
end