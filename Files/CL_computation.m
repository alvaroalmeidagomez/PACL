function [CL] = CL_computation(X,d,Tang_M,t,k)


N = size(X,1);
CL={};

elementos = 1:d;
dCk=nchoosek(d, k);
matriz_combinaciones = nchoosek(elementos, k);
d_dis=zeros(N,1);
G=zeros(N,N);

for i=1:N
    sum_temp=0;
    xi=X(i,:);
    for j=1:N
         xj=X(j,:);
        var_temp=vecnorm(xi-xj)/t;
        G(i,j)=exp(-power(var_temp,2)/2);
        sum_temp=sum_temp+exp(-power(var_temp,2)/2);
    end
    d_dis(i,1)=sum_temp;
end


for i=1:N
    Oi=squeeze(Tang_M(i,:,:));
    for j=1:N
        Oj=squeeze(Tang_M(j,:,:));
        A_temp=transpose(Oi)*Oj;
        
        M_temp=zeros(dCk,dCk);
        
        for l1=1:dCk
            for l2=1:dCk
               ind1=matriz_combinaciones(l1,:);
               ind2=matriz_combinaciones(l2,:);
               M_temp(l1,l2)= det(A_temp(ind1,ind2));
            end
        end
        CL{i,j}=(1/power(t,2))*(G(i,j)/d_dis(i))*M_temp;
        
    end
end
end

