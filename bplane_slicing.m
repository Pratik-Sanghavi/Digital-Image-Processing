function y=bplane_slicing(i)
[r,c]=size(i);
y=zeros(r,c,8);
y=uint8(y);
for w=1:8
    for m=1:r
        for n=1:c
            if i(m,n)>=2^w
                y(m,n,w)=1;
            else
                y(m,n,w)=0;
            end
        end
    end
    y(:,:,w)=bitshift(y(:,:,w),w);
end
y(:,:,:)=uint8(y(:,:,:));

subplot(3,3,1);
imshow(i);

subplot(3,3,2);
imshow(y(:,:,1));

subplot(3,3,3);
imshow(y(:,:,2));

subplot(3,3,4);
imshow(y(:,:,3));

subplot(3,3,5);
imshow(y(:,:,4));

subplot(3,3,6);
imshow(y(:,:,5));

subplot(3,3,7);
imshow(y(:,:,6));

subplot(3,3,8);
imshow(y(:,:,7));

subplot(3,3,9);
imshow(y(:,:,8));
end