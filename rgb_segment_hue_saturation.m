img = (imread('../images/rgbfixed.png'));
[r,c,d] = size(img);
img = im2double(img);

hsi_image = rgb2hsv(img);
imshow(hsi_image)

hue = hsi_image(:,:,1);
saturation = hsi_image(:,:,2);
intensity = hsi_image(:,:,3);

for i=1:r
    for j=1:c
        if(hue(i,j)*360 == 0 && saturation(i,j) == 1 || hue(i,j)*360 == 60 && saturation(i,j) == 1)  %purest red 
            intensity(i,j) = intensity(i,j);
        else
            intensity(i,j) = 0;
        end    
    end
end   

new_img = cat(3,hue,saturation,intensity);
new_rgb = hsv2rgb(new_img);
imshow(new_rgb)