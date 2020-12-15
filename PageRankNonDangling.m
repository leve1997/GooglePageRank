function [pr, i] = PageRankNonDangling(H, x0, f, alpha, tol, maxit)
n = max(size(H));
H = MakeStochasticByRow(H, n);
x0 = x0 / norm(x0, 1);

for i = 1:maxit
    pr = (1 - alpha) * H' * x0 + alpha * f;
    if (norm(pr - x0) < tol) 
        return;
    end
    x0 = pr;
end
end

