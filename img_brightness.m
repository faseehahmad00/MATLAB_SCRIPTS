img = imread('/home/anonymous/Mscripts/img.jpg');
grayimg  = rgb2gray(img);


subplot(2,3,1), imshow(grayimg-60);
subplot(2,3,2), imshow(grayimg-30);
subplot(2,3,3), imshow(grayimg);
subplot(2,3,4), imshow(grayimg+30);
subplot(2,3,5), imshow(grayimg+60);
subplot(2,3, 6), imshow(grayimg+90);


