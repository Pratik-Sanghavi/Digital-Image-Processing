%% Input from user for choice of image
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i1=imread(k);
og1=i1;
%% Input from user for number of neighbouring pixels to be considered
prompt='Enter number of pixels to be considered for averaging (in terms of dimension of square):\n';
k1=input(prompt);
pts=floor(k1./2);
for w1=1:3
    for j=(pts+1):(size(i1,2)-pts-1)
        for i=(pts+1):(size(i1,1)-pts-1)
            pic=og1(i-pts:i+pts,j-pts:j+pts,w1);
            test=sum(sum(pic));
            test=test./(k1.^2);
            i1(i,j,w1)=test;
        end
    end
end
%% Display original and generated image
subplot(1,2,1);
imshow(og1);
subplot(1,2,2);
imshow(i1);