function anomaly = conicanom(ths,e)
if e < 1
    anomaly = 2*atan(sqrt((1-e)/(1+e))*tan(ths/2));
    anomaly = posangle(anomaly);
elseif e > 1
    anomaly = 2*atanh(sqrt((e-1)/(e+1))*tan(ths/2));
end
end