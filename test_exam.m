img = zeros(2,4,3);
img = im2uint8(img);

img(:,:,1) = [128 128 128 128 ;
              255 255  0   0];

img(:,:,2) = [128 128 128 128 ;
              0 255  0   255];

img(:,:,3) = [128 128 128 128 ;
              0 255  0   0];
          
% imshow(img) 
hsv = rgb2hsv(img);
h   = hsv(:,:,1);
s   = hsv(:,:,2);
v   = hsv(:,:,3);

hsv = rescale(hsv,0,255);
subplot(1,3,1),imhist(h);
subplot(1,3,2),imhist(s);
subplot(1,3,3),imhist(v);