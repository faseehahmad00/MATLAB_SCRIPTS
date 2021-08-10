img = (imread('../images/rgbfixed.png'));
[r,c,d] = size(img);
img = im2double(img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
I = (R+G+B)/3; %inetnsity plane

hsi_image = rgb2hsv(img);
imshow(hsi_image)

hue = hsi_image(:,:,1);
saturation = hsi_image(:,:,2);
intensity = hsi_image(:,:,3);

for i=1:r
    for j=1:c
        if(hue(i,j) ~= 0 || I(i,j) ==1)
            intensity(i,j) = 0;
        end    
    end
end   

new_img = cat(3,hue,saturation,intensity);
new_rgb = hsv2rgb(new_img);
imshow(new_rgb)