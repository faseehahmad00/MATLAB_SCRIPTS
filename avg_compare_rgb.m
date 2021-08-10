% Read a RGB Image
A=imread('../images/lena.jpg');

%Represent the RGB image in [0 1] range
I=im2double(A);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

hsv_image = rgb2hsv(I);
V = hsv_image(:,:,3);
filter = ones(11,11) / 121 ;

R = imfilter(R,filter);
G = imfilter(G,filter);
B = imfilter(B,filter);
V = imfilter(V,filter);

new_rgb = cat(3,R,G,B);
new_hsv = cat(3,hsv_image(:,:,1),hsv_image(:,:,2),V);

subplot(1,2,1),imshow(new_rgb)
subplot(1,2,2),imshow(hsv2rgb(new_hsv))
