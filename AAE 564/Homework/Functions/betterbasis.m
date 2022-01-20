function M = betterbasis(M)
% reorders columns in ascending order and makes pivots = +1

temp = [];
% remove columns
for j = 1:size(M,2) % for each column
    temp(j) = ~logical(sum(M(:,j)~=0));
end
M(:,find(temp==1))=[];

% find first nonzero elements in each column
k = 1;
A = [];
for j = 1:size(M,2) % all columns
    for i = 1:size(M,1) % all rows in each column
        if M(i,j) ~= 0
            A(k,:) = [i,j];
            k = k + 1;
            break
        end
    end
end

if ~isempty(A)
    % sort by columns
    B = sortrows(A,1);

    for p = 1:size(B,1)
        N(:,p) = M(:,B(p,2))/M(B(p,1),B(p,2));

    %     N(:,p) = M(:,B(p,2));
    %     if M(B(p,1),B(p,2)) < 0
    %         N(:,p) = -N(:,p);
    %     end
    end
else
    N = M;
end

% add zero colums back
M = [N zeros(size(M,1),sum(temp))];
end