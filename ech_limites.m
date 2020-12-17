function [n1,n2] = ech_limites(signal)
% La signature est binarisée
% On identifie les bornes blanches jusqu'à ce qu'on trouve la première
% bande noire

% Borne gauche
i = 1;
while(signal(i) == 0)
    i = i+1;
end
n1 = i;

% Borne droite
i = length(signal);
while(signal(i) == 0)
    i = i-1;
end
n2 = i;

end