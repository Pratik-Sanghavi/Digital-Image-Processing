function y=i_flip(i)
y=zeros(size(i));
r=size(i,1);
c=size(i,2);
y=i(:,end:-1:1,:);
for m=1:r
    for n=1:c
        y(m,n,:)=i(m,(c+1-n),:);
    end
end
end