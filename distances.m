circle = ones(500,500);
square = ones(500,500);
diamond = ones(500,500);
[r,c] = size(circle);
radius=150;

for i=1:r
  for j=1:c
      
% euclidean distance (forms a circle)
   if(sqrt((r/2 - i)^2 + (c/2 - j)^2) <= radius)
    circle(i,j) = 0;
   end 
   
%CityBlock distance (forms a diamond)
    if((abs(r/2 - i) + abs(c/2 - j)) <= radius )
     diamond(i,j) = 0;
    end 

%Chess Board Distance(forms a square)
   if(max(abs(r/2 - i) , abs(c/2 - j)) <= radius)
    square(i,j) = 0;  
   end  
   
   end
end

subplot(2,2,1) , imshow(circle)
subplot(2,2,2) , imshow(square)
subplot(2,2,3) , imshow(diamond)

figure , imshow(square)


