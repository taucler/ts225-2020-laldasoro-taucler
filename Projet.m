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
[signature1,M] = extraction_signature(L,P1,P2,N);
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

% Détermination des points limites
P_debut = M(:,borne_gauche);
P_fin = M(:,borne_droite);
x2 = [P_debut(1),P_fin(1)];
y2 = [P_debut(2),P_fin(2)];

figure('NumberTitle','off','name',"Image avec points limites");
imshow(uint8(Y));
hold on;
line(x2,y2);

% Calcul rayon utile et l'unité de base u
rayon_utile = sqrt((x2(1)-x2(2))^2 + (y2(1)-y2(2))^2);
u = floor(rayon_utile/95);

% Signature le long du rayon utile
signature3 = extraction_signature(L,P_debut,P_fin,u*95);
figure('NumberTitle','off','name',"Signature le long du rayon utile");
plot(signature3);

% Binarisation de la signature
[histo,count] = hist(signature3,256);
index_seuil = otsu(histo);
seuil = count(index_seuil);

signature4 = binarisation(signature3,seuil);

figure('NumberTitle','off','name',"Signature après binarisation");
plot(signature4);

% Décodage signature binarisée
[codeBarre,cle] = decodage_codeBarre(signature4,u);

