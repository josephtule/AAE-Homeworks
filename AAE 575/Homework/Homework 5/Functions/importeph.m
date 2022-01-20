% function ephdat = importeph(data,prn)
% eph = readtable(data);
% eph = table2array(eph(:,2));
% n = (prn-1)*24;
% eph = eph(n+1:n+23);
% eph([1 18]) = [];
% n2 = 16;
% eph2 = convertCharsToStrings(eph);
% ephdat = zeros(size(eph2));
% for i = 1:length(eph2)
%     temp = char(eph2(i));
%     temp2 = str2double(temp(1:n2));
%     ephdat(i) = temp2;
% end
% end

function ephdat = importeph(data,prn)
eph = readtable(data);
eph = table2array(eph(:,2));
n2 = 16;
% remove variable names
for i = 1:length(eph)
    temp = char(eph(i));
    if length(temp) < 4
        temp2(i) = str2double(temp);
    else
        temp2(i) = str2double(temp(1:n2));
    end
end
temp2 = temp2';
n = find(temp2 == prn);

ephdat = temp2(n:n+22);
ephdat([1 18]) = [];
end








