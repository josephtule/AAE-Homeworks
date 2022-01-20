function [alpha, beta] = alphabeta(v0,vN,dv,dgamma)
dgamma = abs(dgamma);
dv = norm(dv);
angles = asin(vN/dv * sin(dgamma)); 
angles = [angles pi-angles];

if v0 > vN
    alpha = max(angles);
    beta = min(angles);
elseif v0 < vN
    alpha = min(angles);
    beta = max(angles);
elseif dv == 0
    alpha = 0;
    beta = pi;
else
    alpha = max(angles);
    beta = min(angles);
end

if dgamma < 0
    alpha = -abs(alpha);
else
    alpha = abs(alpha);
end

% if abs(alpha) > pi
%     temp = alpha;
%     alpha = beta;
%     beta = temp;
% 
% end

end