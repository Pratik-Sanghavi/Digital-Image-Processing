%% Taking input from user for choice of image 
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
%% Obtain a section of the image
dimsn=size(i);
isec=i(0.25*dimsn(1):0.75*dimsn(1),0.25*dimsn(2):0.75*dimsn(2),1:3);
%% Display image as well as image section
figure(1)
subplot(121);
imshow(i);
subplot(122);
imshow(isec);
%% Input from user for number of neighbouring pixels to be considered
prompt='Enter number of pixels to be considered for averaging (in terms of dimension of square):\n';
k1=input(prompt);
%% Calling averaging filter
iavg=avgfilter(isec,k1,3);
%% Putting it back into original image
imod=i;
imod(0.25*dimsn(1):0.75*dimsn(1),0.25*dimsn(2):0.75*dimsn(2),1:3)=iavg;
%% Display original and generated image
figure(2)
subplot(1,2,1);
imshow(imod);
subplot(1,2,2);
imshow(i);
%% Calling sharpening filter
prompt='Enter number of pixels to be considered for sharpening (in terms of dimension of square):\n';
k1=input(prompt);
isharp=genshpfilter(i,k1,3);
%Negative of Sharpened image
ineg=255-isharp;
%% Display original and generated image
figure(3)
subplot(1,3,1);
imshow(isharp);
subplot(1,3,2);
imshow(i);
subplot(1,3,3);
imshow(ineg);
%% Unsharp Masking
igray=rgb2gray(i);
iblur=avgfilter(igray,k1,1);
irmblur=igray-iblur;
%% Display generated image
figure(4)
imshow(irmblur);