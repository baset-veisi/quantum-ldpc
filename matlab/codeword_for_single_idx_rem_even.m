function c = codeword_for_single_idx_rem_even(n)
m = floor(n^2/2);
first_half_c = zeros([1,m]);
rrange = 1:m;
first_half_c(mod(rrange,n)==1) = 1;
second_half_c = zeros([1,m]);
mm = floor(n/2);
for i = 2:mm
    second_half_c(mod(rrange,n)==i) = 1;
c = [first_half_c,second_half_c];
c = c(:);
end