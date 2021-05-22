image = rgb2gray(imread('images/lena.jpg'));%read the image

rmin = 100;         
rmax = 180;         
[r,c]= size(image); 
s = zeros(r,c);    
for i = 1:r
    for j = 1:c
        if (rmin < image(i,j)&& image(i,j) < rmax)  
            s(i,j) = image(i,j);
        else
            s(i,j) = 0;

        end
    end
end

subplot(1,2,1),imshow(uint8(image)),title('original');
subplot(1,2,2),imshow(uint8(s)),title('intensity range 100-180');      