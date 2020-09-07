%% Image Restoration
%% Taking User Input
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
if size(i,3)==3
   i=rgb2gray(i); 
end
%% Illumination Correction
prompt='Do you wish to correct illumination in the image(Y/N)?:\n';
k=input(prompt,'s');
if k=='Y' || k=='y'
   prompt='Please enter standard deviation:\n';
    D0=input(prompt);
    disp('Difference of Gaussian method has been implemented');
    prompt='Please enter lower gamma threshold:\n';
    lowg=input(prompt);
    prompt='Please enter upper gamma threshold:\n';
    highg=input(prompt);
    i=homomorphic_fil(i,D0,lowg,highg); 
end
%% Adding noise
ignoise=imnoise(i,'gaussian');
%% Filtering via low pass filter
prompt='Please enter distance upto which lowpass will allow signal:\n';
D0=input(prompt);
ilpfil=ideal_lp_fil(ignoise,D0);
%% Displaying output
subplot(121)
imshow(ignoise)
subplot(122)
imshow(ilpfil)
%% Adding salt and pepper noise
ispnoise=imnoise(i,'salt & pepper');
%% Filtering via median filter
prompt='Enter number of pixels to be considered for filtering (in terms of dimension of square):\n';
N=input(prompt);
imedfil=median_fil(ispnoise,N);
%% Displaying output
figure
subplot(121)
imshow(ispnoise)
subplot(122)
imshow(imedfil)
%% Clear Command Console
clc;