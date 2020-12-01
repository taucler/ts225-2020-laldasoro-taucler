function [index_seuil] = otsu(histo)

cpt = histo.Data;
L = length(cpt);
Scpt = sum(cpt);
w = cpt/Scpt;
premu = zeros(1,L);

    for i = 1:L
        premu(i) = i*cpt(i);
    end
mu = premu/Scpt;

crit = zeros(1,L);

    for k = 1:L
        crit(k) = w(k).*(mu(L)-mu(k)).^2 + (1-w(k)).*mu(k).^2;
    end

index_seuil = 0;
max = 0;
    for i = 1:L
        if crit(i)>max
            max = crit(i);
            index_seuil = i;
        end
    end
end

