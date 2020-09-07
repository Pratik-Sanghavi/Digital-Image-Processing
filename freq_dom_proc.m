prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
if size(i,3)==3
   i=rgb2gray(i); 
end
prompt='Please enter distance upto which lowpass will allow signal:\n';
D0=input(prompt);
ilfil=ideal_lp_fil(i,D0);
figure(1)
subplot(1,2,1)
imshow(i);
subplot(1,2,2)
imshow(ilfil);
prompt='Please enter distance from which highpass will allow signal:\n';
Dh=input(prompt);
ihfil=ideal_hp_fil(i,Dh);
figure(2)
subplot(1,2,1)
imshow(i);
subplot(1,2,2)
imshow(ihfil);