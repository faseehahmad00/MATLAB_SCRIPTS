low  = ((imread('images/low3.png')));
% low = uint8([170 25 60 60 ;170 80 60 25;170 80 60 25;80 80 60 80]);
[r,c] = size(low);

%creating histogram for 'low' image
low_hist = imhist(low);

%normalizing histogram pdf
low_hist = low_hist/(r*c);

%creating new image
new_img = zeros(r,c); 

%calculating CDF 
for i=2:256
    low_hist(i) = low_hist(i) + low_hist(i-1);
end    

%multiplying probabilities with 255 to get actual image values
low_hist = low_hist*255;

%assigning values.
for i=1:r
    for j=1:c
       new_img(i,j) = low_hist((low(i,j)+1)); %adding 1 because index starts with 1
    end
end    

% changing to uint for display purpose
new_img = uint8(new_img);

subplot(2,3,1) , imshow(low),title('original')
subplot(2,3,2) , imshow(new_img),title('custom function')
subplot(2,3,3) , imshow(histeq(low)),title('histeq function')
subplot(2,3,4) , imhist(low)
subplot(2,3,5) , imhist(new_img)
subplot(2,3,6) , imhist(histeq(low,255))
