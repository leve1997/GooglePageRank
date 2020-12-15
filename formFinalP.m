function PPP = formFinalP(P, a, v, alpha)
n = max(size(P));
PPP = alpha .* P + (alpha * a + (1 - alpha) * ones(n,1)) * v';
end

