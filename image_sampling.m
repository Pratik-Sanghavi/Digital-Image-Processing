function y=image_sampling(im,N)
pts=floor(N./2);
dim=size(im,3);
if dim==3
    dim1=3;
else
    dim1=1;
end
for w1=1:dim1
    for j=(pts+1):pts+1:(size(im,2)-pts-1)
        for i=(pts+1):pts+1:(size(im,1)-pts-1)
            im(i-pts:i+pts,j-pts:j+pts,w1)=im(i,j,w1);
        end
    end
end
y=uint8(im);
end