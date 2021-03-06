function [GPS_wk, GPS_sec_wk] = GPSweek(Y,M,D,H,min,sec)
% This function finds GPS week and GPS second of the week.
% Inputs are
%		(1-6)   Year, mo, day, hrs (in military time), minutes, 
%			then seconds.
% Outputs are
%		(1-2)	GPS week, and GPS seconds of the week.



format long;

if nargin==4

	min=0;

	sec=0;

end

UT=H+(min/60)+(sec/3600);

if M > 2

	y=Y;

	m=M;

else

	y=Y-1;

	m=M+12;

end

JD=fix(365.25*y) + fix(30.6001*(m+1)) + D + (UT/24) + 1720981.5;

GPS_wk=fix((JD-2444244.5)/7);

GPS_sec_wk=round( ( ((JD-2444244.5)/7)-GPS_wk)*7*24*3600);
end
