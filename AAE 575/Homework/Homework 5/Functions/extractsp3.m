function [data] = extractsp3(igsdata,n)
igr = read_sp3(igsdata);
i = find(igr.data(:,3)==n);
data = igr.data(i,:);
end