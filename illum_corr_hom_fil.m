%% Taking input from user
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
 if size(i,3)==3
    i=rgb2gray(i); 
 end
prompt='Please enter standard deviation:\n';
D0=input(prompt);
disp('Difference of Gaussian method has been implemented');
prompt='Please enter lower gamma threshold:\n';
lowg=input(prompt);
prompt='Please enter upper gamma threshold:\n';
highg=input(prompt);
%% Passing to filter for further processing
i_corr=homomorphic_fil(i,D0,lowg,highg);
%i_corr=2*(real(i_corr).^2);
%% Plotting of output and comparison with original image
figure(1)
subplot(1,2,1)
imshow(i);
subplot(1,2,2)
imshow(i_corr);