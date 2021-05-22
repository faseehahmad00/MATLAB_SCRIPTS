img = rgb2gray(imread('images/lena.jpg'));
[r,c] = size(img);
intensities = zeros(1,255);

for i=1:r
    for j=1:c
        intensities(img(i,j)) = intensities(img(i,j))+1;
    end
end    

plot(intensities);
