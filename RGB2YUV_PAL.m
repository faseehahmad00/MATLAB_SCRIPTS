% Read a RGB Image
A=imread('../images/rgbfixed.png');

%Represent the RGB image in [0 1] range
I=im2double(A);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

C_matrix = [0.299 0.587 0.114;-0.147 -0.289 0.436;0.615 -0.515 -0.1];

Y=R;
U=G;
V=B;

for i=1:r
    for j=1:c
          NEW = C_matrix * [R(i,j);G(i,j);B(i,j)];  
          Y(i,j) = NEW(1);
          U(i,j) = NEW(2);
          V(i,j) = NEW(3);
    end
end    

YUV = cat(3,Y,I,Q) ; 

