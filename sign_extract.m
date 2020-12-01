clear;
close all;
clc;

I = double(imread('./database/lion.jpg'));
[h,w,c] = size(I);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%%% Passage à l'espace YCbCr
Y = 0.299*R+0.587*G+0.114*B;
Cb = 0.564*(B-Y)+128;
Cr = 0.713*(R-Y)+128;
L = (R+G+B)/3;
figure, imshow(uint8(Y));

[x,y] = ginput(2);
line(x,y)
p1 = [x(1) y(1)];
p2 = [x(2) y(2)];
long = sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);

U = 2*round(long);
M = zeros(2,U);
S = zeros(1,U);

for i=1:U
    M(:,i) = p1 + (p2-p1)*(i-1)/(U-1);
    S(1,i) = L(round(M(2,i)),round(M(1,i)));
end

histo = histogram(S,256);
index_seuil = otsu(histo);

figure
plot(S); title('Avant détermination des limites');

% ideb = 1;
% ifin = U;
% while S(1,ideb) >= 85
%     ideb = ideb + 1;
% end
% while S(1,ifin) >= 85
%     ifin = ifin - 1;
% end
% 
% S = S(1, ideb:ifin);
% 
% figure
% plot(S); title('Après détermination des limites');