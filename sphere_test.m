img = (imread('../images/strawberry.png'));
figure , imshow(img)
[r,c,d] = size(img);
img = im2double(img);

a = [0.6863,0.1608,0.1922];
W = 0.2549;

for i=1:r
    for j=1:c
        if( (img(i,j,1)-a(1)) > W/2 || (img(i,j,2) - a(2)) >W/2 || (img(i,j,3) - a(3)) > W/2 )
            img(i,j,:) = 0.5;
        end
       
    end
end

figure , imshow(img);