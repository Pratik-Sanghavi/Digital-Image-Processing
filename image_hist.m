%% Taking input from user for choice of image 
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
im=imread(k);
%% Computing probabilities (Works for black and white images but not for color images)
dim=size(im,3);
if dim==3
    im=rgb2gray(im);
end
pr=prob_mat(im);
% code=hoffman_encoder(pr);
% disp(dec2bin(code'));