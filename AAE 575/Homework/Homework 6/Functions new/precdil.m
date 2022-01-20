function [GDOP,PDOP,TDOP,HDOP,VDOP,Genu] = precdil(XHAT,H,estGEO)
x = XHAT(1); y = XHAT(2); z = XHAT(3);
lat = estGEO(1,1); long = estGEO(1,2); h = estGEO(1,3);
G = inv(H'*H);
GDOP = sqrt(trace(G));
PDOP = sqrt(G(1,1)+G(2,2)+G(3,3));
TDOP = sqrt(G(4,4));
[ex,nx,ux] = ecef2enu(x+1,y,z,lat,long,h,wgs84Ellipsoid);
[ey,ny,uy] = ecef2enu(x,y+1,z,lat,long,h,wgs84Ellipsoid);
[ez,nz,uz] = ecef2enu(x,y,z+1,lat,long,h,wgs84Ellipsoid);
Tr = [ex,nx,ux;ey,ny,uy;ez,nz,uz]';
Tr = [Tr, zeros(3,1); zeros(1,3) 1];
Genu = Tr*G*inv(Tr);
HDOP = sqrt(Genu(1,1)+Genu(2,2));
VDOP = sqrt(Genu(3,3));
end
