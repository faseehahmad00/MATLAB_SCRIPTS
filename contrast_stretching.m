img = imread('images/low3.png');    %select a low contrast image.
% grayscale = double(rgb2gray(img));
[r,c] = size(grayscale);


r_min = min(min(grayscale));
r_max = max(max(grayscale));
L = 2^8;  %8 bit image
newimg = grayscale;

for i=1:r
    for j=1:c
        newimg(i,j) = round (((grayscale(i,j) - r_min) * (255)) / (r_max-r_min));
    end
end  
newimg = uint8(newimg);
subplot(1,2,1),imhist(img);
subplot(1,2,2),imhist(newimg);
