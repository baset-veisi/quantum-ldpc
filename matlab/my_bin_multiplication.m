function Y = my_bin_multiplication(H,X)
H = logical(H); X = logical(X);
Y = mod(H*X,2);
end