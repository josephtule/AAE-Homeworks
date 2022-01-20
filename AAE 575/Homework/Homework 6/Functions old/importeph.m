function ephdat = importeph(data,prn)
opts = detectImportOptions(data);
opts.Delimiter = {'=',':'};
opts.DataLines = [1 inf];
ephr = readtable(data,opts);
eph = table2array(ephr(:,2));
n = find(eph == prn);
ephdat = eph(n:n+22);
ephdat([1 18]) = []; % remove prn number and week
end