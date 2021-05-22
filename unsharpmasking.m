img  = rgb2gray(imread('/home/anonymous/Mscripts/images/img.jpg'));
[r,c] = size(img);

mask = 3;
n = floor(mask/2);

filter =  img;

for i=n+1:r-n
    for j=n+1:c-n
        temp  = img(i-n:i+n,j-n:j+n); 
        filter(i,j) = sum(temp,'all')/mask^2;
    end
end  

edges = img - filter;
subplot(1,2,1) ,imshow(img);
subplot(1,2,2) , imshow(img+edges)
