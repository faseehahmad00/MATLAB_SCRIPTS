img  = imread('/home/anonymous/Mscripts/lena.jpeg');
gray = rgb2gray(img);
[r,c] = size(gray);
subplot(1,2,1) ,imshow(gray,[]);

mask = 3;
n = floor(mask/2);

filter =  gray;

for i=n+1:r-n
    for j=n+1:c-n
        temp  = double(reshape(gray(i-n:i+n,j-n:j+n),[1,mask^2]))*-1;
        temp(1,ceil(length(temp)/2)) = abs(temp(1,ceil(length(temp)/2)) * (mask^2 - 1));     
        filter(i,j) = sum(temp);
    end
end  

subplot(1,2,2) , imshow(filter,[]);
