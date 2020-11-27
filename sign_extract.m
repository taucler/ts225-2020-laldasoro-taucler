clear;
close all;
clc;

I = double(imread('./database/209844.jpg'));
[h,w,c] = size(I);
figure, imshow(I);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%%% Passage à l'espace YCbCr
Y = 0.299*R+0.587*G+0.114*B;
Cb = 0.564*(B-Y)+128;
Cr = 0.713*(R-Y)+128;
L = (R+G+B)/3;
imshow(uint8(Y));

[x,y] = ginput(2);
p1 = [x(1),y(1)];
p2 = [x(2),y(2)];
long = sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);

U = 2*round(long);
M = zeros(2,U);

for i=1:U
    M(:,i) = p1 + (p2-p1)*(i-1)/(U-1);
end

line(x,y)

% figure
% plot(profil)
% xlabel('Segment')
% ylabel('Intensite')
% grid