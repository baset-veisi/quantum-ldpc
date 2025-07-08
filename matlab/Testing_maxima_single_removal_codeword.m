%% Testing maxima single removal codeword
rng_of_test = 4:2:100;
rowDeleted = true;
number_of_incorrect_tests = 0;
for n = rng_of_test
    A = repCodePCM(n);
    A1 = A; %A1 = rowDeleter(A,3);
    A2 = A; %A2 = rowDeleter(A,3);
    Hx = kron(A1,A2);
    B = spcCodePCM(n);Hz = asymmH(B);
    if rowDeleted
        Hx_r = rowDeleter(Hx,ceil(((n-1)^2)/2));
    else
        Hx_r = Hx;
    end
    c_n_first_half = zeros([(n^2)/2,1]);
    c_n_second_half = zeros([(n^2)/2,1]);
    i = 1:floor(n^2/2);
    c_n_second_half(mod(i,n) > n/2) = 1;
    c_n_second_half(mod(i,n) == 0) = 1;
    c_n = [c_n_first_half;c_n_second_half];
    j = sum(my_bin_multiplication(Hx_r,c_n))==0;
    number_of_incorrect_tests = number_of_incorrect_tests + ~j;

end
number_of_incorrect_tests