function [chiffre,element] = decodage_chiffre(chiffre_code)

serie = zeros(1,7);

% identification 
for i=1:7
    if(chiffre_code(i) == 0)
        serie(i) = 'B';
    else
        serie(i) = 'N';
    end
end

% traitement série obtenue
if (strcmp(serie,'BBBNNBN')==1)
    chiffre = 0;
    element = 'A';
elseif (strcmp(serie,'BNBBNNN')==1)
        chiffre = 0;
        element = 'B';        
elseif (strcmp(serie,'NNNBBNB')==1)
        chiffre = 0;
        element = 'C';
elseif (strcmp(serie,'BBNNBBN')==1)
        chiffre = 1;
        element = 'A';
elseif (strcmp(serie,'BNNBBNN')==1)
        chiffre = 1;
        element = 'B';
elseif (strcmp(serie,'NNBBNNB')==1)
        chiffre = 1;
        element = 'C';
elseif (strcmp(serie,'BBNBBNN')==1)
        chiffre = 2;
        element = 'A';
elseif (strcmp(serie,'BBNNBNN')==1)
        chiffre = 2;
        element = 'B';
elseif (strcmp(serie,'NNBNNBB')==1)
        chiffre = 2;
        element = 'C';
elseif (strcmp(serie,'BNNNNBN')==1)
        chiffre = 3;
        element = 'A';
elseif (strcmp(serie,'BNBBBBN')==1)
        chiffre = 3;
        element = 'B';
elseif (strcmp(serie,'NBBBBNB')==1)
        chiffre = 3;
        element = 'C';
elseif (strcmp(serie,'BNBBBNN')==1)
        chiffre = 4;
        element = 'A';
elseif (strcmp(serie,'BBNNNBN')==1)
        chiffre = 4;
        element = 'B';
elseif (strcmp(serie,'NBNNNBB')==1)        
        chiffre = 4;
        element = 'C';
elseif (strcmp(serie,'BNNBBBN')==1)        
        chiffre = 5;
        element = 'A';
elseif (strcmp(serie,'BNNNBBN')==1)        
        chiffre = 5;
        element = 'B';
elseif (strcmp(serie,'NBBNNNB')==1)
        chiffre = 5;
        element = 'C';
elseif (strcmp(serie,'BNBNNNN')==1)
        chiffre = 6;
        element = 'A';
elseif (strcmp(serie,'BBBNBN')==1)
        chiffre = 6;
        element = 'B';
elseif (strcmp(serie,'NBNBBBB')==1)        
        chiffre = 6;
        element = 'C';
elseif (strcmp(serie,'BNNNBNN')==1)        
        chiffre = 7;
        element = 'A';
elseif (strcmp(serie,'BBNBBBN')==1)        
        chiffre = 7;
        element = 'B';
elseif (strcmp(serie,'NBBBNBB')==1)
        chiffre = 7;
        element = 'C';
elseif (strcmp(serie,'BNNBNNN')==1) 
        chiffre = 8;
        element = 'A';
elseif (strcmp(serie,'BBBNBBN')==1)        
        chiffre = 8;
        element = 'B';
elseif (strcmp(serie,'NBBNBBB')==1)
        chiffre = 8;
        element = 'C';
elseif (strcmp(serie,'BBBNBNN')==1)
        chiffre = 9;
        element = 'A';
elseif (strcmp(serie,'BBNBNNN')==1)        
        chiffre = 9;
        element = 'B';
elseif (strcmp(serie,'NNNBNBB')==1)
        chiffre = 9;
        element = 'C';
end
end