function [G] = MakeStochasticByRow(G, k)
n = max(size(G));
for i = 1 : n
   row_norm = norm(G(i,:), 1);
   if row_norm ~= 0
   G(i,:) = G(i,:) / row_norm;
   end
end
end