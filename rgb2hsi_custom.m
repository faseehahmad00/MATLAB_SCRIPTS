% Read a RGB Image
% A=imread('../images/rgbfixed.png');
% A = zeros(1,1,3);
% A(1,1,1) = 0;
% A(1,1,2) = 1;
% A(1,1,3) = 0.5;
A = zeros(2,2,3);
A(:,:,1) = [250 120;20 100];
A(:,:,2) = [200 140;50 50];
A(:,:,3) = [150 250;20 200];
%Represent the RGB image in [0 1] range
I=im2double(A);
% 
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;

%To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));

%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);

%Normalize to the range [0 1]
H=H/360;

%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);


%Intensity
I=sum(I,3)./3;

HSI = cat(3,H,S,I);