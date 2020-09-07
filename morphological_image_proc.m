%% Morphological Image Processing
%% Taking User Input
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
i=rgb2gray(i);
i=imbinarize(i);
%% Processing
s=strel('sphere',2);
imdil=imdilate(i,s);
imer=imerode(i,s);
imo=imopen(i,s);
imc=imclose(i,s);
%imf=imfill(i,s);
% strel() used for structuring element
%% Display output
figure;
subplot(331)
imshow(i);
subplot(332)
imshow(imdil);
subplot(333)
imshow(imer);
subplot(334)
imshow(imo);
subplot(335)
imshow(imc);
% subplot(336)
% imshow(imf);
%% Taking User Input
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
i=rgb2gray(i);
i=imbinarize(i);
%% Processing
s=strel('sphere',2);
imdil=imdilate(i,s) ;
imb1=abs(i-imdil);
imer=imerode(i,s);
imb2=i-imer;
imb3=imdil-imer;
%% Display output
figure;
subplot(131)
imshow(imb1);
subplot(132)
imshow(imb2);
subplot(133)
imshow(imb3);