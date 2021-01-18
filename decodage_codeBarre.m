function [codeBarre,cle] = decodage_codeBarre(signal,u)
codeBarre = zeros(1,13);
elements = zeros(1,6);

Mat_decodage = {'AAAAAA','AABABB','AABBAB','AABBBA','ABAABB','ABBAAB','ABBBAA','ABABAB','ABABBA','ABBABA'};


% Segmentation du signal bc en 5 parties
[P1,P2,P3,P4,P5] = segmentation(signal,u);

% 2e et 4e régions
for i=1:6
    [codeBarre(1,i+1),elements(i)] = decodage_chiffre(P2(((i-1)*14)+1:(i*14),u));
    codeBarre(1,i+7) = decodage_chiffre(P4(((i-1)*14)+1:(i*14),u));
end

% 1ère région (région normale gauche)
for i=1:length(Mat_decodage)
    if strcmp(elements,Mat_decodage(i))==1
        codeBarre_num(1) = i;
    end
end


% 5e région (région normale droite)
sum_pair = 0;
sum_impair = 0;
for i=1:12
    if(mod(i,2)==0)
        sum_pair = sum_pair + codeBarre(i);
    else
        sum_impair = sum_impair + codeBarre(i);
    end
end
sum = sum_impair + 3*sum_pair;
cle = mod(sum,10);