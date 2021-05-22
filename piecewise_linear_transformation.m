img = rgb2gray(imread('images/lena.jpg'));
[row,col] = size(img);

for i=1:row
    for j=1:col
        if(img(i,j)>0 && img(i,j)<100)
            img(i,j) = img(i,j) *2;
        elseif(img(i,j)>100 && img(i,j)<200)
            img(i,j) = img(i,j);
        else
            img(i,j) = img(i,j)/2;
        end                
    end
end    
