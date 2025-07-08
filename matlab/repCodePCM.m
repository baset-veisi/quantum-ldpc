function [A] = repCodePCM(n)
u = ones(n-1,1);u = u(:);v = ones(n,1);v = v(:);
A = diag(v) + diag(u,1);
A = A(1:n-1,:);
end