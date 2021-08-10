%fa18-bcs-055 
%This function displays original,noised and denoised image with adpative median filter
%It creates salt and pepper noise of given probability  
%It denoises image using adaptive median filter with provided Smax parameter

function [] = myFourthAssignment(filename,Smax,probab)
%nargin specifies the amount of parameters passed.
%checking missing parameters
%If parameters are missing we provide default values    
    switch nargin
    case 1                  %if only one parameter is passed it provide defaults to other two.
        Smax = 11;
        probab = 0.4;
    case 2                  %if two parameters are passed it provide defaults to remaining one.
        probab = 0.4;
    end
    
    img = (imread(filename));
    [r,c,d] = size(img);  

    %RGB TO GRAY
    if(d>1)                       % d represents image channels.
        img  = rgb2gray(img); % if image is RGB, convert to grayscale(1 channel) 
    end
    
    %converting image to double to perform operations
    img = im2double(img);
    
    win_start_size = 3; %starting window_size (as 3*3 is smallest filter ) 
    
    %MaxSize specifies the maximum window size used in operation
    setMaxSize(win_start_size); 
    
    %noising image according to provided noise probability
    noisy = imnoise(img,'salt & pepper',probab);
    
    %creating black image of same size as original image
    medianfiltered = zeros(r,c);
    
    %variable n specifies the required padding around image based on Smax
    n = floor(Smax/2); 
    
    
    for i=n+1:r-n
        for j=n+1:c-n
            medianfiltered(i,j) = levelA(noisy,i,j,win_start_size,Smax);
        end
    end  

    %plotting original, noised and denoised image
    subplot(1,3,1),imshow(img,[]),title("original image");
    subplot(1,3,2),imshow(noisy,[]),title("noise probability : "+probab);
    subplot(1,3,3),imshow(medianfiltered,[]),title("max window: "+getMaxSize+" / Smax:"+Smax);
end

% level A function for Noise Severity Level
function a = levelA(img,i,j,window_size,Smax)
    n = floor(window_size/2);    %n specifies the pixels to be included in window
    temp = img(i-n:i+n,j-n:j+n); %temp contains the window of original image based on window_size 
    Zxy = img(i,j);              %value of center pixel
    %calculating Zmin,Zmax & Zmed of window i.e. (MIN,MAX,MEDIAN)
    Zmin = min(min(temp));    
    Zmax = max(max(temp));
    Zmed = median(temp,'all');
    %calculating A1 and A2
    A1 = Zmed - Zmin;
    A2 = Zmed - Zmax;
    if(A1>0 && A2<0)
        a=levelB(Zxy,Zmax,Zmin,Zmed); %going to level B
    else
        window_size = window_size+2 ;
        if((window_size)  <= Smax)  
            if(window_size > getMaxSize) %updating max_window_size.
                setMaxSize(window_size);
            end  
            a = levelA(img,i,j,window_size,Smax); %calling levelA function with bigger window size
        else
            a = Zmed;
        end
    end   
end

%level B function for center pixel validation
function b = levelB(Zxy,Zmax,Zmin,Zmed)
    %calculating B1 and B2 
    B1 = Zxy - Zmin;
    B2 = Zxy - Zmax;
    if(B1>0 && B2<0)
        b=Zxy; %returning center value 
    else
        b=Zmed; %returning median 
    end    
end

% variable x keeps track of the maximum window size used in adaptive median filter.
% The below function are used to keep track of maximum window size used in operation 

%setter function for global x(Max_Window_size)
function setMaxSize(val)
    global x
    x = val;
end

%getter function for global x(Max_Window_size)
function r = getMaxSize
    global x
    r = x;
end