% Read a RGB Image
A=imread('../images/rgbfixed.png');

%Represent the RGB image in [0 1] range
I=im2double(A);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
[r,c] = size(R);

C = 1 - R;
M = 1 - G;
Y = 1 - B;

cmy = cat(3, C, M, Y);

