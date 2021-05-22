img = rgb2gray(imread('images/img.jpg'));
mask = 3;
n = floor(mask/2); 
noisy = imnoise(im2double(img),'salt & pepper',0.1);
subplot(1,2,1) , imshow(noisy);
[r,c] = size(noisy);
medianfilter = noisy;

for i=n+1:r-n
    for j=n+1:c-n
        temp  = noisy(i-n:i+n,j-n:j+n);
        medianfilter(i,j) = median(temp,'all');
    end
end  
subplot(1,2,2) , imshow(medianfilter);

