img = rgb2gray(imread('images/lena.jpg'));
subplot(2,3,1) , imshow(img), title('original image');

mask = 3;
n = floor(mask/2);

noisy = imnoise(im2double(img),'salt & pepper');


subplot(2,3,2) , imshow(noisy), title('salt & pepper');

[r,c] = size(noisy);
avgfilter = noisy;
medianfilter = noisy;
maxfilter = noisy;
minfilter = noisy;

for i=n+1:r-n
    for j=n+1:c-n
        temp  = noisy(i-n:i+n,j-n:j+n);
        medianfilter(i,j) = median(median(temp));
        maxfilter(i,j) = max(max(temp));
        minfilter(i,j) = min(min(temp));
        avgfilter(i,j) = sum(temp,'all')/mask^2;
    end
end  

subplot(2,3,3) , imshow(avgfilter), title('avg-filter');

subplot(2,3,4) , imshow(minfilter), title('min-filter');

subplot(2,3,5) , imshow(maxfilter), title('max-filter');

subplot(2,3,6) , imshow(medianfilter), title('median-filter');

