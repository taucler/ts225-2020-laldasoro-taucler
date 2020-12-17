function [index] = otsu(h)
    N = 256;
    max = 0;
    
    Sum_h = sum(h);
    Sum_w = 0;
    Sum_mu = 0;
    
    for k = 1:N
        for i = 1:k
            Sum_w = Sum_w + h(i); % Somme des h(i) jusqu'à k
            Sum_mu = Sum_mu + i*h(i); % Somme des i*h(i) jusqu'à k
        end    
        
        w(k) = Sum_w/Sum_h;
        mu(k) = Sum_mu/Sum_h;
    end
    
    for k=1:N
        crit = w(k)*(mu(N)-mu(k)).^2 + (1-w(k))*mu(k)^2;
        
        if crit>max
            index = k;
            max = crit;
        end
    end

end