% code size n**2
n = 8;


A = repCodePCM(n);
A1 = A; %A1 = rowDeleter(A,3);
A2 = A; %A2 = rowDeleter(A,3);
Hx = kron(A1,A2);
B = spcCodePCM(n);Hz = asymmH(B);

%
interval_of_search = 9;
feedback_parameter = 10;
initial_acceptance_prob = 0.9;
final_acceptance_prob = 0.01;%was 0.000001
num_iterations = 10000;%was 180000
cooling_rate = 0.95;
%  
rowDeleted = true;
if rowDeleted
    Hx_r = rowDeleter(Hx,[17,19,25,31,33]);
else
    Hx_r = Hx;
end
% 
[r,computed_dz,min_dis_codeword] = simulated_annealing_min_distance(Hx_r,Hz, num_iterations,feedback_parameter,...
    cooling_rate, initial_acceptance_prob, final_acceptance_prob,interval_of_search);

r
computed_dz
min_dis_codeword



% cc = codeword_for_single_idx_rem_even(n);
% ISIT = sum(my_bin_multiplication(Hx_r,cc))==0
% 



% [c,d] = onlyTrueDistancePCM(Hx_r,Hz,false,real_dz)
% [idx_of_ones,ISIT] = test_my_codeWord(Hx_r,c)

% c_s = [1;zeros(n^2-n,1);ones(n-1,1)];
% for i = n:n^2-n
%     if moHx_rd(i,n) == 1
%         c_s(i) = 1;
%     end
% end
% sum(Hx_r*c_s)
% c_n = [zeros(n/2,1);ones(n/2,1)];
% c = [zeros(n^2/2,1);kron(ones(n/2,1),c_n)];
% cc = [1;zeros(n^2-1,1)];
% Hx_r*c
number_of_cycles_per_T = log((feedback_parameter/(feedback_parameter+4))...
    *log(initial_acceptance_prob)/log(final_acceptance_prob))/log(cooling_rate);
number_of_cycles_per_T = ceil(number_of_cycles_per_T);
total_checked_vectors = num_iterations*number_of_cycles_per_T;
total_space = 0;
for i = interval_of_search
        total_space = total_space + nchoosek(n^2,i);
end
frac_of_space_checked = total_checked_vectors/total_space;