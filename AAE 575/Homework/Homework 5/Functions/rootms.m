function rms = rootms(x,t,t0,tf)
t0ind = closeto(t,t0);
tfind = closeto(t,tf);
n = abs(tfind-t0ind);
rms = sqrt(1/n * sum(x(t0ind:tfind).^2));
end