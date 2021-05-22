img = rgb2gray(imread('/home/anonymous/Mscripts/img.jpg'));
[r,c] = size(img);
subplot(1,2,1) , imshow(img)

% using for loop 
for i=1:r
    for j=1:c
        img(i,j) = 255 - img(i,j);
    end 
end    

% using matrix operations
% negimg = 255 - gray;

subplot(1,2,2) , imshow(img)
