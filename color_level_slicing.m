gray=im2gray(imread('../images/lena.jpg'));
imshow(gray)
[r,c] = size(gray);

new_rgb = zeros(r,c,3);

for i=1:r
    for j=1:c
        if(gray(i,j)>0 && gray(i,j)<100)
            new_rgb(i,j,1) = 255;
        elseif(gray(i,j)> 100 && gray(i,j)< 200)
            new_rgb(i,j,2) = 255;
        else
            new_rgb(i,j,3) = 255;
        end  
    end
end

imshow(new_rgb)