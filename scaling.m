img  = rgb2gray(imread('images/lena.jpg'));
[r,c] = size(img);
subplot(1,2,1) , imshow(img);
cx=3;cy=4;
scaled = zeros(r*cx,c*cy);
scaling_mat = inv([cx 0 0;0 cy 0 ;0 0 1]);
for i=1:r*cx
    for j=1:c*cy
        p = mtimes(scaling_mat,[i;j;1]);
        a = round(p(1));
        b = round(p(2));
        if(a >= 1 && a <= r) && (b >= 1 && b <= c)  
         scaled(i,j) = img(a,b);
        end
    end    
end    
subplot(1,2,2) , imshow(scaled,[]);