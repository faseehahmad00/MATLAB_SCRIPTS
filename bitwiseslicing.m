% img = imread('images/cameraman.tif') ;
img = [34 12 ; 128 254];
b1 = mod(img,2);
b2 = floor(mod(bitsra(img,1),2));
b3 = floor(mod(bitsra(img,2),2));
b4 = floor(mod(bitsra(img,3),2));
b5 = floor(mod(bitsra(img,4),2));
b6 = floor(mod(bitsra(img,5),2));
b7 = floor(mod(bitsra(img,6),2));
b8 = floor(mod(bitsra(img,7),2));

subplot(2,4,1),imshow(b1,[]);
subplot(2,4,2),imshow(b2,[]);
subplot(2,4,3),imshow(b3,[]);
subplot(2,4,4),imshow(b4,[]);
subplot(2,4,5),imshow(b5,[]);
subplot(2,4,6),imshow(b6,[]);
subplot(2,4,7),imshow(b7,[]);
subplot(2,4,8),imshow(b8,[]);

%reconstuct
 
 