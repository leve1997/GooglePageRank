function [G] = MakeStochasticByRowK(G, k)
for i = 1 : k
   G(i,:) = G(i,:) / norm(G(i,:), 1);
end
end