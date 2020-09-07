%% Taking input into variable
i=imread('peppers.png');
%% converting image to grayscale 
grayim=rgb2gray(i);
subplot(1,6,1),imshow(i);
subplot(1,6,2),imshow(grayim);
%% Showing the 'r','g' & 'b' planes separately
subplot(1,6,3),imshow(uint8(i(:,:,1)));
subplot(1,6,4),imshow(uint8(i(:,:,2)));
subplot(1,6,5),imshow(uint8(i(:,:,3)));
%% getting the negative of the gray image
neggrayim=255-grayim;
subplot(1,6,6),imshow(neggrayim);
%% trying different transforms on image
%Multiplication operation
mulop=grayim.*2;
%Division operation
divop=grayim./2;
%Logarithmic Transform
logi=double(grayim);
logop=30.*log(1+logi);
%Power law transform
powi=double(grayim);
powop=powi.^2;
%% taking histogram of image
[n,b]=imhist(i);
%equalizing the histogram
ieq=histeq(i);