% Aldasoro Louis & Tom Aucler
clear;
close all;
clc;

%% Extraction de la signature le long d'un rayon 

I = double(imread('database/lion.jpg'));
[h,w,c] = size(I);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% Passage à l'espace YCbCr
Y = 0.299*R + 0.587*G + 0.114*B;
Cb = 0.564*(B-Y) + 128;
Cr = 0.713*(R-Y) + 128;
L = (R+G+B)/3;

figure('NumberTitle','off','name',"Image d'origine");
imshow(uint8(Y));

[x,y] = ginput(2);
line(x,y)
P1 = [x(1),y(1)];
P2 = [x(2),y(2)];
long_rayon = sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);

% Premier échantillonage
N = round(2*long_rayon); % nombre de points
M = zeros(2,N);
signature1 = zeros(1,N);

for i=1:N
    M(:,i) = P1 + (i-1)*(P2-P1)/(N-1);
    signature1(1,i) = L(round(M(2,i)),round(M(1,i)));
end

figure('NumberTitle','off','name',"Première signature avant binarisation");
plot(signature1);


% Binarisation de la signature
[histo,count] = hist(signature1,256);
index_seuil = otsu(histo);
seuil = count(index_seuil);

signature2 = binarisation(signature1,seuil);

figure('NumberTitle','off','name',"Signature après binarisation");
plot(signature2);

% Exclusion des parties gauches droites inutiles (bandes blanches)
[borne_gauche , borne_droite] = ech_limites(signature2);

figure('NumberTitle','off','name',"Signature après binarisation et exclusion des limites");
plot(signature2);

% Calcul unité longueur U et re-définition de la signature
U = length(signature2)/95;



