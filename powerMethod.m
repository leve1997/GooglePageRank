function [x, k] = powerMethod(dD, G, x, alpha, a, v, tol, maxit)
for k = 1:maxit
    x0 = x;
    x = alpha * ((x .* dD) * G) + (alpha * x * a + 1 - alpha) * v' ;
    if (norm(x - x0) < tol)
        return;
    end
end
end