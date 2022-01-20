function plotorbit(ai,ei,ths1,ths2,rotate,color)
ths_plot = linspace(ths1,ths2,2^12)';
ri = (ai*(1-ei^2))./(1+ei*cos(ths_plot));
ri = ri .* [cos(ths_plot-rotate),sin(ths_plot-rotate)];
plot(ri(:,1),ri(:,2),color)
grid on
axis equal
end