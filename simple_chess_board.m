img=zeros(400);
for i=1:400
    for j=1:400
        row=floor(i/100);
        col=floor(j/100);
        if mod((row+col),2) ==0
            img(i,j)=255;
        end
    end
end
imshow(img);