function c = codeword_for_complete_H(n)
c_1 = zeros([1,n*(n-1)]);
vec = 1:n*(n-1);
c_1(mod(vec,n)==1) = 1;
c_2 = ones([1,n]);c_2(1) = 0;
c = [c_1,c_2];
c = c(:);
end