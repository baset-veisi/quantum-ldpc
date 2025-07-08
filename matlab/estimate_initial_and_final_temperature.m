function [T_f,T_0] = estimate_initial_and_final_temperature(H,...
    feedback_parameter,initial_acceptance_prob, final_acceptance_prob)
    

    % Computing the initial and final temperatures
    column_weights = sum(H,1);
    max_weight = max(column_weights);
    delta_f_max = max_weight + feedback_parameter;
    delta_f_min = feedback_parameter;
    T_0 = delta_f_max/log(1/initial_acceptance_prob);
    T_f = delta_f_min/log(1/final_acceptance_prob);
end
