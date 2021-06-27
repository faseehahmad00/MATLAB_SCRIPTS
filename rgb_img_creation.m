rgb  = zeros(2,3,3);

r = [1 1 0;0 0 1];
g = [0 1 1 ; 1 0 0];
b = [0 0 0; 1 1 1];

rgb(:,:,1) = r;
rgb(:,:,2) = g;
rgb(:,:,3) = b;
rgb  = imresize(rgb,100,'nearest');
hsi  = rgb2hsv(rgb);
imshow(hsi)

