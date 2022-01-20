function plotvel(a,e,ths,v,color,dvoption,angle,scale)
% dvoption = [option, [v0]]
% v in xy coordinates
rmag = a*(1-e^2)/(1+e*cos(ths));
% iCr = [cos(ths-angle) -sin(ths-angle); sin(ths-angle) cos(ths-angle)];
% v = iCr*v;
if dvoption(1) == 1
    v0 = dvoption(2:3);
    v0 = iCr * v0;
    quiver(rmag*cos(ths-angle)+v0(1)*scale,rmag*sin(ths-angle)+v0(2)*scale,v(1),v(2),scale,color) % dV
else
    quiver(rmag*cos(ths-angle),rmag*sin(ths-angle),v(1),v(2),scale,color)
end
end