function [idx_of_ones, flag]=test_my_codeWord(H,c)
vec = 1:length(c);
idx_of_ones = vec(c==1);
flag = sum(my_bin_multiplication(H,c))==0;
end
