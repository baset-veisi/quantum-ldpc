function X = Perturb_state(X0,number_of_ones)
K = length(X0);
m_perturbation = randi([floor(K/10),floor(K/6)]);
pos_of_perturbation = randperm(K,m_perturbation);
Xprime = zeros([K,1]);Xprime(pos_of_perturbation) = 1;
% Perturbing
Xprime = logical(Xprime); X0 = logical(X0);
X = xor(X0,Xprime);
weight = sum(X);
if weight < number_of_ones
    all_zeros = sum(~X);
    randomly_chosen_flips = randperm(all_zeros,number_of_ones-weight);
    vec = 1:K;
    idx_of_zeros = vec(X==0);
    zero_flips_to_one = idx_of_zeros(randomly_chosen_flips);
    X(zero_flips_to_one) = 1;
elseif weight > number_of_ones
    all_ones = sum(X);
    randomly_chosen_flips = randperm(all_ones,-number_of_ones+weight);
    vec = 1:K;
    idx_of_ones = vec(X==1);
    one_flips_to_zero = idx_of_ones(randomly_chosen_flips);
    X(one_flips_to_zero) = 0;
end
X = double(X);
end