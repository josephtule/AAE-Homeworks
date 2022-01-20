function [observe,control] = abilT(A,B,C)
% Gives observability and controllability transformation matrices and their
% respsective submatrices

if B == 0
    B = zeros(size(A,1),1);
end
if C == 0
    C = zeros(1,size(A,1));
end

Qo = obsv(A,C);
No = betterbasis(null(Qo,'r'));
% To = [eye(size(A,1),size(A,2)-size(No,2)),No];
[~,~,To] = svd(Qo);

Qc = ctrb(A,B);
Rc = betterbasis(orth(Qc));
% Tc = [Rc,eye(size(A,1),size(A,2)-size(Rc,2))];
[Tc,~,~] = svd(Qc);

% To = betterbasis(To); Tc = betterbasis(Tc);

Anew_o = To^-1*A*To;
no = rank(Qo);
Aoo = Anew_o(1:no,1:no);
Auu_o = Anew_o(no+1:end,no+1:end);

Anew_c = Tc^-1*A*Tc;
nc = rank(Qc);
Acc = Anew_c(1:nc,1:nc);
Auu_c = Anew_c(nc+1:end,nc+1:end);

observe = {To, Aoo, Auu_o};
control = {Tc, Acc, Auu_c};
end