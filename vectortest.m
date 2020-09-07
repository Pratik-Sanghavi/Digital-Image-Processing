%% Taking input from user for choice of image 
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
im=imread(k);
%% Vectorize Image
prompt='Please enter Threshold for color:\n';
thres=input(prompt);
prompt='Please enter amount of smoothening:\n';
avg=input(prompt);
iv=vectorize_image(im,thres,avg);
subplot(2,1,1);
imshow(im);
subplot(2,1,2);
imshow(iv);
% %% Sampling Image
% prompt='Please enter Sampling Rate:\n';
% t=input(prompt);
% y=image_sampling(im,t);
% imshow(y,[]);
% %%Computing probabilities (Works for black and white images but not for color images)
% dim=size(y,3);
% if dim==3
%     y=rgb2gray(y);
% end
% pr=prob_mat(y);
% code=hoffman_encoder(pr);
% for t=1:size(code,2)
%     m=dec2bin(code(2,t));
%     fprintf("%d: %s\n",code(1,t),m);
% end