function [H, k, v] = SendDanglingNodesToEnd(H)
n=max(size(H)); % H je kvadratna matrica
v=1:n;
k=0;% broj dangling cvorova
i=1;
while i <= n-k
    flag = 0;
    for j = 1 : n
        if H(i,j)~=0
            flag = 1;
            break;
        end
    end
    if flag == 0 
        H = SwapNodes(H, i, n-k);
        temp = v(i);
        v(i) = v(n-k);
        v(n-k) = temp;
        k = k + 1;
        i = i - 1;
    end
    i = i + 1;
end
k = n - k;
end