function [Acc,Auu] = ctrbM(A,B)
% gives Acc and Auu matrix from A and B matrices
    [~,T] = abilT(A,B,0);
    Anew = T^-1*A*T;
    Qc = ctrb(A,B);
    nc = rank(Qc);
    Acc = Anew(1:nc,1:nc);
    Auu = Anew(nc+1:end,nc+1:end);
end