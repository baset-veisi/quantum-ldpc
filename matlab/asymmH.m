function [H] = asymmH(B)
[~,n] = size(B);
H = [kron(eye(n),B);kron(B,eye(n))];
end
%gfweight(Hx_3,'par')