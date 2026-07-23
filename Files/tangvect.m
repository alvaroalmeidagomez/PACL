function Tang_M = tangvect(X)

    m = size(X,1);
    dim_var=size(X,2);

    Tang_M = zeros(m,dim_var,dim_var-1);

    for i = 1:m

        vtemp = X(i,:);
        Tang_M(i,:,:) = null(vtemp);

    end

end