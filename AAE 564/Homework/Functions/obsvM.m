function [Aoo,Auu] = obsvM(A,C)
% Gives Aoo and Auu matrices from A and C matrices
    [T,~] = abilT(A,0,C);
    Anew = T^-1*A*T;
    Qo = obsv(A,B);
    no = rank(Qo);
    Aoo = Anew(1:no,1:no);
    Auu = Anew(no+1:end,no+1:end);
end