function ind = closeto(x,xi)
error = abs(x-xi);
min_error = min(error);
ind = find(error == min_error);
end