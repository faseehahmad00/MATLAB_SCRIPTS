%fa18-bcs-055 
%This function displays original,noised and average denoised and median
%denoised versions of provided image after applying filter of size
%mask*mask

function [] = mySecondAssignment(filename,mask)
image = imread(filename);
[r,c,d] = size(image);  

%RGB TO GRAY
if(d>1)                       % d represents image channels.
    image  = rgb2gray(image); % if image is RGB, convert to grayscale(1 channel) 
end

%creating salt and pepper noise
noisy_image  = imnoise(image,'salt & pepper');

%creating 2 images same as noisy image to filter
median_denoised = noisy_image;
avg_denoised = noisy_image;

%noise_removal (ignoring boundry)
n = floor(mask/2);  %the value of n adjusts according to mask size
for i=n+1:r-n
    for j=n+1:c-n
        %temp selects a sub-matrix of size mask*mask
        temp  = noisy_image(i-n:i+n,j-n:j+n);
         %following syntax using 'all' is suported in matlab 2018b+
         avg_denoised(i,j) = sum(temp,'all')/(mask^2); 
         median_denoised(i,j) = median(temp,'all');        
    end
end  

%displaying images in a 2x2 subplot
subplot(2,2,1),imshow(image),title('original image')
subplot(2,2,2),imshow(noisy_image),title('noisy image')
subplot(2,2,3),imshow(avg_denoised),title('averaging filter')
subplot(2,2,4),imshow(median_denoised),title('median filter')

%saving in current directory
imwrite(avg_denoised,'denoisedimage_averaging.bmp');
imwrite(median_denoised,'denoisedimage_median.jpeg');
end

