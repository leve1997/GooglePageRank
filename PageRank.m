function [pr, perm, iter] = PageRank(H,v,w,alpha)
%%
%   H = (H11 H12; 0 0)
%   H11 je matrica kxk, H12 je matrica kx(n-k)
%   w = (w1 w2)' 
%   S = H + (0 e)'*w'
%   G = alpha*S + (1-alpha)*e*v';
%   =>
%   u = (u1 u2)' = alpha*w + (1-alpha)*v
%   G = (G11 G12;e*u1' e*u2')
%   
%%
[H, k, perm] = SendDanglingNodesToEnd(H);
H = MakeStochasticByRowK(H, k);
n= max(size(H));
sigma = ones(1, k+1)/(k+1);
H11 = H(1:k, 1:k);
H12 = H(1:k, k+1:n);
v1 = v(1 : k);
v2 = v(k+1 : n);
w1 = w(1 : k);
w2 = w(k+1 : n);
epsilon=1e-5; %tocnost

%prvi korak algoritma
sigma(1:k) = alpha*sigma(1:k)*H11 + (1-alpha)*v1' + alpha*sigma(k+1)*w1';
sigma(k+1)= 1 - sigma(1:k)*ones(k,1);
sigma0=sigma;
iter = 1;
%iteracije algortima
while iter
    sigma(1:k) = alpha*sigma(1:k)*H11 + (1-alpha)*v1' + alpha*sigma(k+1)*w1';
    sigma(k+1)= 1 - sigma(1:k)*ones(k,1);
    if norm(sigma-sigma0)<epsilon
        break;
    end
    sigma0=sigma;
    iter = iter + 1;
end

pr=[sigma(1:k) alpha*sigma(1:k)*H12+(1-alpha)*v2'+alpha*sigma(k+1)*w2'];
end