function ths = trueanom(anomaly,e)
if e < 1
    ths = 2*atan(sqrt((1+e)/(1-e))*tan(anomaly/2));
elseif e > 1
    ths = 2*atan(sqrt((e+1)/(e-1))*tanh(anomaly/2));
end
end