function [remaining,weight,state] = simulated_annealing_min_distance(H,Hz, num_iterations,...
    feedback_parameter, cooling_rate, P_H,P_L,interval_of_search)
    [~, M] = size(H);
    n = ceil(sqrt(M));
    [T_f,T_i] = estimate_initial_and_final_temperature(H,feedback_parameter,P_H, P_L);
    flag = false;
    for s = interval_of_search
        
        % Initializing the state
        number_of_ones = s;
        positions_of_ones = randperm(M,number_of_ones);
        X0 = zeros([M,1]);X0(positions_of_ones) = 1;  
    
        
        X_current = X0;
        
        %while remaining > 0
        T = T_i;
        while T >= T_f
    
            for i = 0:num_iterations
                X_new = Perturb_state(X_current,number_of_ones);
                
                % Diff. in Energy
                deltaE = feedback_parameter*sum(my_bin_multiplication(H,X_new)) - ...
                    feedback_parameter*sum(my_bin_multiplication(H,X_current));
            
                if ((deltaE <= 0) || (rand < exp(-deltaE/T)) && isNotInSpan(Hz,X_new,n))
                    X_current = X_new;
                end
            end
        
            T = cooling_rate*T;
        end
        %end
        remaining = (sum(my_bin_multiplication(H,X_current))==0);
        if remaining 
            flag = true;
            weight = sum(X_current);
            state = X_current;
            break;
        end
    end
    if ~flag
        remaining =false;
        weight = 0;
        state = zeros([M,1]);
    end
    
end
