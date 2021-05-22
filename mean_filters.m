image = round(rgb2gray(imread('images/lena.jpg')));

blurred = avg_filter(image,3);
g_mean = g_mean_filter(image,3);
h_mean = h_mean_filter(image,10);
c_h_mean = contra_h_mean_filter(image,10,-1);
mid_point = midpoint_filter(image,3);
alpha_trimmed = alpha_filter(image,3,0);

subplot(2,3,1),imshow(blurred,[]),title('ARITHMETIC MEAN');
subplot(2,3,2),imshow(g_mean,[]),title('GEOMETRIC MEAN');
subplot(2,3,3), imshow(h_mean,[]),title('HARMONIC MEAN');
subplot(2,3,4), imshow(c_h_mean,[]),title('C_ HARMONIC MEAN');
subplot(2,3,5), imshow(mid_point,[]),title('MID POINT');
subplot(2,3,6), imshow(alpha_trimmed,[]),title('APLHA TRIMMED');
% a  = [1 2 4 7;3 2 1 2 ;6 5 7 1;3 2 1 0];
% round(h_mean_filter(a,3))

%arithmetic mean filter (avg filter) 
function x = avg_filter(image,m)
    img =image;
    [r,c] = size(img); 
    mask = m;
    n = floor(mask/2);
    x =img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            x(i,j) = sum(sum(temp))/mask^2;
        end
    end   
end    

%geometric mean filter
function x = g_mean_filter(image,m)
    img =image;
    [r,c] = size(img);
    mask = m;
    n = floor(mask/2);
    x =img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            x(i,j) = prod(prod(temp))^(1/mask^2);
        end
    end  
end

%harmonic mean filter
function x = h_mean_filter(image,m)
    img =image;
    [r,c] = size(img);
    mask = m;
    n = floor(mask/2);
    x =img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            temp = double(temp) .^ -1;
            x(i,j) = (mask^2) / sum(sum(temp));
        end
    end   
end

%contra-harmonic mean filter
function x = contra_h_mean_filter(image,m,q)
    img =image;
    [r,c] = size(img);
    mask = m;
    n = floor(mask/2);
    x=img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            x(i,j) = round(sum(sum(temp.^(q+1))) / round(sum(sum(temp.^q))));
        end
    end
end

%mid-point filter
function x = midpoint_filter(image,m)
    img =image;
    [r,c] = size(img); 
    mask = m;
    n = floor(mask/2);
    x =img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            min_n = min(min(temp));
            max_n = max(max(temp));
            x(i,j) = (min_n + max_n) /2;
        end
    end   
end 

%alpha-trimmed filter
function x = alpha_filter(image,m,d)
    img =image;
    [r,c] = size(img); 
    mask = m;
    n = floor(mask/2);
    x =img;
    for i=n+1:r-n
        for j=n+1:c-n
            temp = img(i-n:i+n,j-n:j+n);
            temp = sort(reshape(temp,1,m^2));
            temp = temp(1+floor(d/2):end-floor(d/2));
            x(i,j) = sum(sum(temp))/(mask^2 - d);
        end
    end   
end 