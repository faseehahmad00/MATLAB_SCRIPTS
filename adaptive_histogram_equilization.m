image  = (imread('images/tungsten.png'));
new_image = image;
[r,c] = size(image);

Mg = mean(image,'all');   %Global_Mean
Dg = std(double(image),0,'all');  %Global_std  
k0 = 0.4;
k1 = 0.005;
k2 = 0.4;
E = 4;
block_size = 11;
n = floor(block_size/2);

for i=n+1:r-n
    for j=n+1:c-n
        temp  = image(i-n:i+n,j-n:j+n);
        Ml = mean(temp,'all');   %Local_Mean
        Dl = std(double(temp),0,'all');  %Local_std  
        if((Ml <= (k0*Mg))  && ((k1*Dg)<=Dl && Dl<=(k2*Dg)))
%             new_image(i-n:i+n,j-n:j+n) = my_histeq(temp);
          new_image(i-n:i+n,j-n:j+n) = E*temp;
        end    
    end
end 

figure , imshow(image);
figure , imshow(new_image);

function new_img = my_histeq(img)
low = img;
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

%changing to uint for display purpose
new_img = uint8(new_img);
end