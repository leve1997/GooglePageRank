function G = makeGoogle(H, edges)
% H - matrica procitana iz filea
%G = spalloc(web_size, web_size, edges);
G = sparse(H(:,1), H(:,2), ones(edges,1));
end

