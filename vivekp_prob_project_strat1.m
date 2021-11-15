function [e_of_t_ak] = vivekp_prob_project_strat1()
    e_of_t_ak = [];
    p_om = [0.1, 0.2, 0.3, 0.4, 0.5];
    
    for i = 1:numel(p_om)
        e_of_t_a = [];
        for k = 1:19
            if k == 1
                e = 1 / (1 - p_om(i));
                e_of_t_a(end+1) = e;
            elseif k == 2
                e = (p_om(i) + p_om(i) + (1 + e_of_t_a(1)) * (1 - 2 * p_om(i))) / (1 - p_om(i));
                e_of_t_a(end+1) = e;
            else
                e = (p_om(i) + (1 + e_of_t_a(k-2)) * p_om(i) + (1 + e_of_t_a(k-1)) * (1 - 2 * p_om(i))) / (1 - p_om(i));
                e_of_t_a(end+1) = e;
            end
        end
        e_of_t_ak(end+1) = 0.1 * sum(e_of_t_a(10:19));
    end
end
