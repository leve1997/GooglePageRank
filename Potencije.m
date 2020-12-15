function [x, k] = Potencije(A, x, tol, maxit)
for k = 1:maxit
    x0 = x;
    x = x * A;
    if (norm(x - x0) < tol)
        return;
    end
end
end

