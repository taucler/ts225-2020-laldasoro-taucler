% Louis ALDASORO & Tom AUCLER
clear all;
clear;
clc;

%% EXTRACTION DE LA SIGNATURE LE LONG D'UN RAYON
I = imread('./img/lion.jpg');
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
imshow(Y);

[x,y] = ginput(2);
line(x,y);
P1 = [x(1),y(1)];
P2 = [x(2),y(2)];
long_rayon = sqrt((x(1)-x(2))^2+(y(1)-y(2))^2);

N = round(2*long_rayon); % nombre de points
M = zeros(2,N);

for i=1:N
    M(:,i) = P1 + (i-1)*(P2-P1)/(N-1);
end



    
    