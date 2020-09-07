function y=prob_dist(im)
y=zeros(3,256);
dim1=size(im,1);
dim2=size(im,2);
dim3=size(im,3);
for w=1:dim3
    for j=1:dim2
        for i=1:dim1
            num=im(i,j,w);
            y(w,num+1)=y(w,num+1)+1;
        end
    end
end
end