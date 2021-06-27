img  = (imread('/home/anonymous/jupyter notebooks/python/test/107.jpg'));

R = img(:,:,1);
[r,c] = size(R);
G = img(:,:,2);
B = img(:,:,3);
hsv_image = rgb2hsv(img);
intensity_plane = hsv_image(:,:,3);
intensity_plane = rescale(intensity_plane,0,0.8);
figure , imshow(intensity_plane) , title("rescaling")
% log_transformation
intensity_plane = 1.5 * log (1 + intensity_plane);
figure , imshow(intensity_plane) , title("log transform")

filter = ones(7,7)/49;
blurred =    imfilter(intensity_plane,filter);
edges = intensity_plane - blurred;
sharpened = intensity_plane + edges;
figure , imshow(sharpened) , title('sharpened')
new_img = zeros(r,c,3);
new_img(:,:,1) = hsv_image(:,:,1);
new_img(:,:,2) = hsv_image(:,:,2);
new_img(:,:,3) = sharpened ;
figure , imshow(new_img);
newrgb = hsv2rgb(new_img);
figure , imshow(newrgb);

imwrite(newrgb,'/home/anonymous/jupyter notebooks/python/test/fixednew.jpg')

% imshow(sharpened);