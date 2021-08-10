% Read a RGB Image
A=imread('../images/rgbfixed.png');

%Represent the RGB image in [0 1] range
I=im2double(A);
intensity = (I(:,:,1) + I(:,:,2) + I(:,:,3)) /3;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
[r,c] = size(R);

C = 1 - R;
M = 1 - G;
Y = 1 - B;

cmy = cat(3, C, M, Y);
new_inverse = 1 - I;
new_hsv = rgb2hsv(I);
h = new_hsv(:,:,1);
s = new_hsv(:,:,2);
% v = new_hsv(:,:,3);
v = intensity;
hsv = cat(3,h,s,v);

subplot(1,3,1),imshow(cmy);
subplot(1,3,2),imshow(new_inverse);
subplot(1,3,3),imshow(hsv2rgb(hsv));

