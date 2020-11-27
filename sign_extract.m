clear;
close all;
clc;

I = imread('./database/209844.jpg');
[h,w,c] = size(I);
figure, imshow(I);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%%% Passage à l'espace YCbCr

Y=0.299*R+0.587*G+0.114*B;
Cb=0.564*(B-Y)+128;
Cr=0.713*(R-Y)+128;
L=(R+G+B)/3;

[x,y] = ginput(2);
% x = round(x);
% y = round(y);
p1 = [x(1),y(1)];
p2 = [x(2),y(2)];
long = norm(p1-p2);


line(x,y)

% figure
% plot(profil)
% xlabel('Segment')
% ylabel('Intensite')
% grid