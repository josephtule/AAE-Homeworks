function [a,alpha,beta] = bisection(TOF,amin,c,mu,type,tol)
s = amin*2;
if type(2) == 'A' | type(2) == 'B'
    amax = 100*amin;
elseif type(2) == 'H'
    amax = -100*amin;
    amin = 0;
end

TOFtest = TOF + 100000;
% for i = 1:10
while ~(abs(TOF - TOFtest) < tol)
    aguess = (amax+amin)/2;
    if isequal(type,'1A')
        alpha = 2*asin(sqrt(s/2/aguess));
        beta = 2*asin(sqrt((s-c)/2/aguess));
        TOFtest = sqrt(aguess^3/mu) * ((alpha - beta) - (sin(alpha) - sin(beta)));
    elseif isequal(type,'1B')
        alpha = 2*pi-2*asin(sqrt(s/2/aguess));
        beta = 2*asin(sqrt((s-c)/2/aguess));
        TOFtest = sqrt(aguess^3/mu) * ((alpha - beta) - (sin(alpha) - sin(beta)));
    elseif isequal(type,'2A')
        alpha = 2*asin(sqrt(s/2/aguess));
        beta = -2*asin(sqrt((s-c)/2/aguess));
        TOFtest = sqrt(aguess^3/mu) * ((alpha - beta) - (sin(alpha) - sin(beta)));
    elseif isequal(type,'2B')
        alpha = 2*pi-2*asin(sqrt(s/2/aguess));
        beta = -2*asin(sqrt((s-c)/2/aguess));
        TOFtest = sqrt(aguess^3/mu) * ((alpha - beta) - (sin(alpha) - sin(beta)));
    elseif isequal(type,'1H')
        alpha = 2*asinh(sqrt(s/2/abs(aguess)));
        beta = 2*asinh(sqrt((s-c)/2/abs(aguess)));
        TOFtest = sqrt(abs(aguess)^3/mu)*((sinh(alpha)-alpha)-(sinh(beta)-beta));
    elseif isequal(type,'2H')
        alpha = 2*asinh(sqrt(s/2/abs(aguess)));
        beta = -2*asinh(sqrt((s-c)/2/abs(aguess)));
        TOFtest = sqrt(abs(aguess)^3/mu)*((sinh(alpha)-alpha)-(sinh(beta)-beta));
    end
    
    if type(2) == 'A' 
        if TOFtest > TOF
            amin = aguess;
        elseif TOFtest < TOF
            amax = aguess;
        else
            break
        end        
    elseif type(2) == 'H'| type(2) == 'B'
        if TOFtest < TOF
            amin = aguess;
        elseif TOFtest > TOF
            amax = aguess;
        else
            break
        end
        
    end
    
end
a = aguess;
end