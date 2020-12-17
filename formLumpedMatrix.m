function [u, F] = formLumpedMatrix(H,v,indexes,alpha,w)
% inicijalizacija
m = max(size(w(1,:)));
k = indexes(2,1);
F = zeros(k+m);
% treba nam taj u
u = formLumpedVectors(v, alpha, w);

%prvi stupac
F(1:k, 1:k) = H(1:k, 1:k);
F(k+1:k+m,1:k) = u(1:k,:)';
% prvi redak
for i = 2:m + 1
    start = indexes(1,i);
    kraj = indexes(2,i);
    F(1:k, i + k - 1) = H(1:k, start:kraj) * ones(kraj - start + 1,1);
end

% sada formiramo F(k+1:k+m, k+1:k+m)
for j = 1:m
for i = 2:m + 1
    start = indexes(1,i);
    kraj = indexes(2,i);
    F(k+j, i + k - 1) = u(start:kraj,j)' * ones(kraj - start + 1, 1);
end
end
end

