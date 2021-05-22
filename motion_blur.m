img  = rgb2gray(imread('lena.jpg'));
motionblur = 1/21 * eye(9) ;
filtered = imfilter(img,motionblur);
imshow(filtered,[])