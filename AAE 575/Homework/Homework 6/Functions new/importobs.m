function [tk,prange,cphaseL1,cphaseL2] = importobs(data,prnset)
% Import data from .obs file that has been converted to .dat file type
n = length(prnset);
data = readtable(data);
tk_ind = 1:n+2:length(data{:,1})-1;
tk = data{tk_ind,3};
for i = 1:length(tk_ind)
    j = tk_ind(i)+1;
    prange(:,i) = data{j:j+n-1,2};
    cphaseL1(:,i) = data{j:j+n-1,3};
    cphaseL2(:,i) = data{j:j+n-1,4};
end
prange=prange';cphaseL1=cphaseL1';cphaseL2=cphaseL2';
end