img  = imread('home/anonymous/Mscripts/lena.jpg');
gray = im2double(rgb2gray(img));
gray = imresize(gray,5,'nearest');

subplot(1,2,1) , imshow(gray) , title('original');
laplacian = [-1 -1 -1; -1 8 -1; -1 -1 -1];
mexican_hat = [0 0 -1 0 0; 0 -1 -2 -1 0;-1 -2 16 -2 -1; 0 -1 -2 -1 0;0 0 -1 0 0];

filtered = imfilter(gray,laplacian);
subplot(1,2,2) , imshow(filtered) , title('laplacian');
