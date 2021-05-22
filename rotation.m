img  = rgb2gray(imread('images/lena.jpg'));
[r,c] = size(img);
rotated = zeros(r,c);
subplot(1,2,1) , imshow(img);
ang = 12;
rotation_mat = inv([cos(ang) sin(ang) 0 ;-sin(ang) cos(ang) 0 ; 0 0 1]);
 
for i=1:r
    for j=1:c
        p = mtimes(rotation_mat,[i ;j ;1]);  
        a = round(p(1)); b=round(p(2));
        if(a >= 1 && a <= r) && (b >= 1 && b <= c)  
%          rotated(a,b) = img(i,j);    %forward mapping
           rotated(i,j) = img(a,b);    %reverse mapping

        end
    end    
end    

subplot(1,2,2) , imshow(rotated,[]);