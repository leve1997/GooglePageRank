function a = formVector_a(A)
n = max(size(A));
e = ones(n,1);

a = double(xor(A * e, e));
end

