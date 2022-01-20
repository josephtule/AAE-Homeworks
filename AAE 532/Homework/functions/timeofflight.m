function [TOF,dt1,dt2] = timeofflight(ths1,ths2,a,e,r1,mu)

if e < 1 % ellipse
    n = sqrt(mu/abs(a)^3);
    E1 = conicanom(ths1,e);
    E2 = conicanom(ths2,e);
    dt1 = (E1-e*sin(E1))/n;
    dt2 = (E2-e*sin(E2))/n;
elseif e > 1 % hyperbola
    n = sqrt(mu/abs(a)^3);
    H1 = conicanom(ths1,e);
    H2 = conicanom(ths2,e);
    dt1 = (e*sinh(H1)-H1)/n;
    dt2 = (e*sinh(H2)-H2)/n;
elseif e == 1 % parabola
    p = r1*(1+cos(ths1));
    n = sqrt(mu/p^3);
    dt1 = (tan(ths1/2)^3 + 3*tan(ths1/2))/6/n;
    dt2 = (tan(ths2/2)^3 + 3*tan(ths2/2))/6/n;
end
TOF = dt2 - dt1;
end


