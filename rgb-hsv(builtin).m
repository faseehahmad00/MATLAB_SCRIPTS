rgb_img = imread('../images/rgbfixed.png');
hsv_img = rgb2hsv(rgb_img);

H= hsv_img(:,:,1);
S= hsv_img(:,:,2);
V= hsv_img(:,:,3);

subplot(1,3,1),imshow(H,[]),title('hue');
subplot(1,3,2),imshow(S,[]),title('saturation')
subplot(1,3,3),imshow(V,[]),title('intensity')