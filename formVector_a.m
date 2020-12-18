function a = formVector_a(A)
%a_i=1 akko i je dangling node
n = max(size(A));
e = ones(n,1);

a = double(xor(A * e, e));
end

