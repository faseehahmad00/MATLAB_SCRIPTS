img = rgb2gray(imread('images/lena.jpg'));
subplot(1,2,1) , imshow(img);
[r,c]   = size(img);
tx = 10 ; ty=20 ;
trans_mat = inv([1 0 0;0 1 0;tx ty 1]);
translated = zeros(r,c);

for i=1:r
    for j=1:c
        p = mtimes(trans_mat,[i;j;1]);
        a = round(p(1)) ; b = round(p(2));
        if(a>=1 && a <= r) && (b>=1 && b<=c)
            translated(i,j) = img(a,b);
        end    
        
    end
end    

subplot(1,2,2) , imshow(translated,[]);