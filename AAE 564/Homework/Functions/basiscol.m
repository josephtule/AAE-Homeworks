function B = basiscol(A)
B = A';
[R,basiccol] = rref(B);
B = B(:,basiccol)';
end