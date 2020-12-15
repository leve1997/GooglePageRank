function invDs = sparseDiagInverse(Ds)
% Ds = sparse matrica dijagonalne matrice
% D(i,j) = 1 / D(i,j) za svaki element
fun = @(x) 1 ./ x;
invDs = spfun(fun, Ds);
end

