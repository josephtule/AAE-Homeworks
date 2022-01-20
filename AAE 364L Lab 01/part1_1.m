t = Cartposition(:,1);
dt = t(2)-t(1);
y = Cartposition(:,2);
ydot = diff(y)/dt; ydot(end+1) = ydot(end);
%%
figure(1)
plot(t,y,'b')
title("Cart Position and Velocity vs Time")
xlabel("Time, s")
ylabel("Cart Position, m; Cart Velocity, m/s")
grid on
hold on
plot(t,ydot,'r')
legend("Cart Position","Cart Velocity")
hold off
%%
m = 1.0731; gamma = 1.7235; Bemf = 7.7236;
% ydot_avg = mean(ydot(3593:3647))
ydot_avg = 1.06854386538119;
y_inf = y(end);
Beq = (y_inf/(ydot_avg*m))^-1
c = Bemf + Beq
%%
t2 = t(1:2875);
figure(2)
plot(t2,y(3156:end))
y_beq = ydot_avg * m / Beq *(1-exp(-Beq*(t)/m));
hold on
plot(t,y_beq)
grid on
title("Cart Position vs Time")
xlabel("Time, s")
ylabel("Cart Position, m")
legend("Experimental Data",'Calculated Position')
xlim([0 2])