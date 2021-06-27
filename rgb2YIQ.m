% Read a RGB Image
A=imread('../images/rgbfixed.png');

%Represent the RGB image in [0 1] range
I=im2double(A);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

C_matrix = [0.299 0.587 0.114;0.596 -0.275 -0.321;0.219 -0.523 0.311];

Y=R;
I=G;
Q=B;

for i=1:r
    for j=1:c
          NEW = C_matrix * [R(i,j);G(i,j);B(i,j)];  
          Y(i,j) = NEW(1);
          I(i,j) = NEW(2);
          Q(i,j) = NEW(3);
    end
end    

YIQ = cat(3,Y,I,Q) ; 
% cmy = cat(3, C, M, Y);

