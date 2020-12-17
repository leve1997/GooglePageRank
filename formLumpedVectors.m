function u = formLumpedVectors(v,alpha, w)
% u = alpha * w + (1-alpha) * v
m = max(size(w(1,:)));
n = max(size(v));
u = zeros(n,m);
for i = 1:m
    u(:, i) = alpha * w(:,i) + (1 - alpha) * v;
end
end

