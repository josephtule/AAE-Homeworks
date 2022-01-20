function plotpos(a,e,ths,color,rotate,scale)
rmag = a*(1-e^2)/(1+e*cos(ths)); r = [rmag 0]';
iCr = [cos(ths-rotate) -sin(ths-rotate); sin(ths-rotate) cos(ths-rotate)];
r = iCr * r;
quiver(r(1),r(2),color,'Autoscale','off')
plotunit(r,ths-rotate,'c--',scale)
end