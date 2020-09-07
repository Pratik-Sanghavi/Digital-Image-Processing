%% User input and appropriate conversions
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
if size(i,3)==3
    i=rgb2gray(i); 
 end
%% Applying Filter
k='y';
ifil=i;
prompt='Enter approximation for distance(for capturing noise)\n';
Du=input(prompt);
while k=='y' || k=='Y'
    ifil=auto_notch_fil(ifil,Du);
    imshow(ifil);
    prompt='Do you wish to filter further(y/n)?\n';
    k=input(prompt,'s');
end
%% Displaying output
figure(1);
subplot(121);
imshow(i);
title('Original Image');
subplot(122);
imshow(ifil);
title('Filtered Image');