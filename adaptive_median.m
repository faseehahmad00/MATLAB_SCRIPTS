tic
img = rgb2gray(imread('../images/lena.jpg'));
[R,C] = size(img);  

img = im2double(img);
prob = 0.02;
Smax = 11;
noised = imnoise(img,'salt & pepper',prob);
filtered_img = ones(R,C);
N = floor(Smax/2); 
    
for i=N+1:R-N
    for j=N+1:C-N
        filtered_img(i,j) = myfunc(i,j,noised,3,Smax);
    end
end  
toc

subplot(3,1,1),imshow(img,[]),title("original");
subplot(3,1,2),imshow(noised,[]),title("noise: "+prob);
subplot(3,1,3),imshow(filtered_img,[]),title("filtered - Smax: "+ Smax);

function a = myfunc(i,j,img,window,Smax)
    %levelA
    n = floor(window/2);
    temp = img(i-n:i+n,j-n:j+n);
    [r,c] = size(temp);
    Zxy = temp(ceil(r*c/2));
    Zmax = max(max(temp));
    Zmin = min(min(temp));
    Zmed = median(temp,'all');
    A1 = Zmed - Zmin;  A2 = Zmed - Zmax;
    if(A1>0 && A2<0)
        %level B
        B1 = Zxy - Zmin;
        B2 = Zxy - Zmax;
        if(B1>0 && B2<0)
            a=Zxy;
        else
            a=Zmed;
        end 
    elseif((window+2)  <= Smax)
        window = window+2 ;   
        a = myfunc(i,j,img,window,Smax);
    else
        a = Zmed;
    end    
end
