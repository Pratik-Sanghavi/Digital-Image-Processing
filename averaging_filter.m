%% Input from user for choice of image
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
%% Conversion to grayscale for processing
grayim=rgb2gray(i);
oggray=grayim;
%% Input from user for number of neighbouring pixels to be considered
prompt='Enter number of pixels to be considered for averaging (in terms of dimension of square):\n';
k1=input(prompt);
pts=floor(k1./2);
for j=pts+1:size(grayim,2)-pts-1
    for i=pts+1:size(grayim,1)-pts-1
       pic=oggray(i-pts:i+pts,j-pts:j+pts);
       test=sum(sum(pic));
       test=test./(k1.^2);
       grayim(i,j)=test;
    end
end
%% Display original and generated image
subplot(1,2,1);
imshow(oggray);
subplot(1,2,2);
imshow(grayim);