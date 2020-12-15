function u = formLumpedVectors(v,alpha, varargin)
% u = alpha * w + (1-alpha) * v
m = nargin - 2;
n = max(size(v));
u = zeros(n,m);
for i = 1:m
    w = varargin{i};
    u(:, i) = alpha * w + (1 - alpha) * v;
end
end

