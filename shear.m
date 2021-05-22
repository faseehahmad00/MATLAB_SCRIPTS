img = rgb2gray(imread('images/lena.jpg'));
subplot(1,2,1) , imshow(img);
[r,c]   = size(img);
sv = 2 ; sh=2 ;
shear_x = inv([1 sh 0;0 1 0;0 0 1]);
% shear_y = inv([1 0 0;sv 1 0;0 0 1]);

horizontal = zeros(r,c);

for i=1:r
    for j=1:c
        p = mtimes(shear_x,[i;j;1]);
        a = round(p(1)) ; b = round(p(2));
        if(a>=1 && a <= r) && (b>=1 && b<=c)
            horizontal(i,j) = img(a,b);
        end    
    end
end    

subplot(1,2,2) , imshow(horizontal,[]);