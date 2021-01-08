function [codeBarre_num,cle] = decodage_codeBarre(signal,u)
codeBarre_num = zeros(1,13);
elements = zeros(1,13);

% 2e région
for i=1:6
    [codeBarre_num(i+1),elements(i+1)] = decodage_chiffre(signal((((i-1)*7+4)*u):(i*7+3)*u),u);
end

% 1ère région (région normale gauche)
if (strcmp(elements(2:7),'AAAAAA')==1)
    codeBarre_num(1) = 0;
elseif (strcmp(elements(2:7),'AABABB')==1)
    codeBarre_num(1) = 1;
elseif (strcmp(elements(2:7),'AABBAB')==1)
    codeBarre_num(1) = 2;
elseif (strcmp(elements(2:7),'AABBBA')==1)
    codeBarre_num(1) = 3;
elseif (strcmp(elements(2:7),'ABAABB')==1)
    codeBarre_num(1) = 4;
elseif (strcmp(elements(2:7),'ABBAAB')==1)
    codeBarre_num(1) = 5;
elseif (strcmp(elements(2:7),'ABBBAA')==1)
    codeBarre_num(1) = 6;
elseif (strcmp(elements(2:7),'ABABAB')==1)
    codeBarre_num(1) = 7;
elseif (strcmp(elements(2:7),'ABABBA')==1)
    codeBarre_num(1) = 8;
elseif (strcmp(elements(2:7),'ABBABA')==1)
    codeBarre_num(1) = 9;
end

% 4e région
for i=1:6
    [codeBarre_num(i+7),elements(i+7)] = decodage_chiffre(signal((((i-1)*7+51)*u):((i*7+50)*u)),u);
end

% 5e région (région normale droite)
sum_pair = 0;
sum_impair = 0;
for i=1:12
    if(mod(i,2)==0)
        sum_pair = sum_pair + codeBarre_num(i);
    else
        sum_impair = sum_impair + codeBarre_num(i);
    end
end
sum = sum_impair + 3*sum_pair;
cle = mod(sum,10);