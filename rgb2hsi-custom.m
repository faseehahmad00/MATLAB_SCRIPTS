% Read a RGB Image
A=imread('../images/rgbfixed.png');


%Represent the RGB image in [0 1] range
I=im2double(A);


R=I(:,:,1);
[r,c] = size(R);
G=I(:,:,2);
B=I(:,:,3);

S = G;
I = B;

for i=1:r
    for j=1:c
        S(i,j) = 1-(3/(R(i,j)+G(i,j)+B(i,j)))*min([R(i,j) G(i,j) B(i,j)]);
        I(i,j)  = (R(i,j)+G(i,j)+B(i,j)) ./ 3;  
    end
end    

% Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;

% To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));

% If B>G then H= 360-Theta
H(B>G)=360-H(B>G);

% Normalize to the range [0 1]
H=H/360;

%HSI
HSI=zeros(size(A));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;


figure,
subplot(1,3,1),imshow(H,[]),title('hue');
subplot(1,3,2),imshow(S,[]),title('saturation')
subplot(1,3,3),imshow(I,[]),title('intensity')