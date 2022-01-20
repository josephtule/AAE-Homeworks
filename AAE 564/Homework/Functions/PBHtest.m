function [unobsveig,unctrbeig] = PBHtest(A,B,C)
% Does PBH test for observaility and controllability of a system
    [v,s,w] = eig(A);
    s = diag(s);
    n = size(A,2);
    for i = 1:length(s)
        To = [A-s(i)*eye(size(A));C];
        Tc = [A-s(i)*eye(size(A)),B];
        ro = rank(To);
        rc = rank(Tc);
        testo(i) = ro==n;
        testc(i) = rc==n;
    end
    so = s(~testo);
    sc = s(~testc);
    vo = v(:,~testo);
    vc = v(:,~testc);
    wo = w(:,~testo);
    wc = w(:,~testc);
    unobsveig = {vo,so,wo}; % right eigvec, eig, left eigvec
    unctrbeig = {vc,sc,wc};
end