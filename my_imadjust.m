img  = ((imread('images/low3.png')));
[r,c] = size(img);
s_max = 255;
s_min  = 0;
r_min = min(min(img));
r_max = max(max(img));

newimg = zeros(r,c);

for i=1:r
    for j=1:c
        newimg(i,j) = round((((s_max - s_min / r_max - r_min)) *  ((img(i,j)) - r_min)) + s_min);
    end
end  
 
subplot(2,2,1),imshow(img),title('original');
subplot(2,2,2),imshow(newimg,[]),title('after rescaling');
subplot(2,2,3),imhist(img),title('original');
subplot(2,2,4),imhist(newimg,[]),title('after rescaling');