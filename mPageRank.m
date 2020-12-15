function [pr, perm, iter] = mPageRank(H,v,alpha,varargin)
m = nargin - 3;
if m == 1
    [pr, perm, iter] = PageRank(H,v,varargin{1},alpha);
    return;
end
if m == 0
    return;
end
[H, k, perm] = SendDanglingNodesToEnd(H);
n= max(size(H));
dangling = n - k; % broj dangling cvorova
if m > dangling
    [pr, perm, iter] = PageRank(H,v,varargin{1},alpha);
    return;
end

H = MakeStochasticByRow(H, k);

indexes = splitToParts(dangling, m, k);
% moramo formirati matricu F1
F = formLumpedMatrix(H, v, indexes, alpha, varargin{:});

epsilon=1e-5; %tocnost

% metoda potencija za matricu F
sigma = ones(1, k+m) / (k+m);
[sigma, iter] = Potencije(F, sigma, epsilon, 1000);
pr = [sigma(1:k) sigma * F(:,k+1:k+m)];
end