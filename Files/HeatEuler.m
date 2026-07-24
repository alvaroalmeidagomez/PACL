function v_out = HeatEuler(v0, A, num_iters)
    % HEATEULER Solves the heat equation using the Projected ambient connection Laplacian
    % via the explicit Euler method.
    %
    % Inputs:
    %   v0        : Initial state vector (column vector).
    %   A         : Projected ambient connection Laplacian matrix (should be a sparse matrix).
    %   num_iters : Number of explicit Euler iterations.
    %
    % Output:
    %   v_out     : Final state vector after num_iters.

    % Ensure the input is a column vector
    if ~iscolumn(v0)
        v0 = v0(:);
    end



    % Calculate stable time step.
    % The absolute mathematical limit is 2/max_eig. We use 1.99 to give 
    % a tiny safety margin against floating-point precision drift.
    dt = 0.9 / norm(A);

  


    % Initialize output vector
    v_out = v0;

    % 2. OPTIMIZED LOOP PERFORMANCE
    for i = 1:num_iters
        % CRITICAL FIX: Added parentheses around (A * v_out).
        % 
        % Why this matters:
        % Without parentheses, MATLAB evaluates 'dt * A * v_out' left-to-right.
        % It computes (dt * A) first, which forces MATLAB to allocate memory 
        % for a brand new, scaled matrix during EVERY SINGLE LOOP ITERATION.
        % 
        % By using 'dt * (A * v_out)', MATLAB performs matrix-vector multiplication 
        % first (which outputs a small vector), and then scales that vector by dt. 
        % This simple change makes the loop significantly faster.
        v_out = v_out - dt * (A * v_out);
    end
end