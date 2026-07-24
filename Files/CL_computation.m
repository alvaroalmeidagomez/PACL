function [CL] = CL_computation(X, d, Tang_M, t)

    N = size(X, 1);
    
    % 1. Preallocation (crucial for MATLAB performance)
    CL = cell(N, N);


    % 2. Vectorization of the distance matrix (G) and sums (d_dis)
    Dist_sq = pdist2(X, X, 'squaredeuclidean');
    G = exp(-Dist_sq / (2 * t^2));
    d_dis = sum(G, 2);

    % 3. Extract slices outside the inner loop to prevent repetitive 'squeeze' calls
    O_cells = cell(N, 1);
    for i = 1:N
        O_cells{i} = squeeze(Tang_M(i, :, :));
    end

    % 4. Loop optimization utilizing mathematical symmetry
    for i = 1:N
        Oi = O_cells{i};
        
        % Start inner loop at 'i' to compute only the upper triangle
        for j = i:N 
            Oj = O_cells{j};
            
            A_temp = Oi' * Oj;
            M_temp = zeros(d, d);
            
            % Compute the k x k minors
            for l1 = 1:d
                for l2 = 1:d
                    M_temp(l1, l2) = det(A_temp(l1, l2));
                end
            end
            
            % Calculate shared base value (the G matrix is mathematically symmetric)
            shared_base = G(i, j);
            
            % Assign result for the upper triangle: CL{i, j}
            CL{i, j} = (shared_base / d_dis(i)) * M_temp;
            
            % Exploit symmetry for the lower triangle: CL{j, i}
            % Since Oj' * Oi = (Oi' * Oj)', its minors matrix is simply M_temp'
            if i ~= j
                CL{j, i} = (shared_base / d_dis(j)) * M_temp';
            end
            
        end
    end
end