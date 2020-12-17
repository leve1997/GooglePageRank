function w = generateDanglingNodeVector(n, m)
w = rand(n, m);
for i = 1:m
    w(:,i) = w(:,i) / norm(w(:,i), 1); 
end
end

