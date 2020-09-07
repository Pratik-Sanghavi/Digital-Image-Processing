function i1=genshpfilter(i1,k1,dim)
if dim==3
    p3=3;
else
    p3=1;
end
filtmat=zeros(ceil(k1/2),ceil(k1/2));
for x=1:ceil(k1/2)
    filtmat(x,ceil(k1/2))=2.^(x-1);
    rng=x-2:-1:-4000;
    it=1;
    for y=ceil(k1/2)-1:-1:ceil(k1/2)-x
        if rng(it)<0
            continue
        end
        filtmat(x,y)=2.^rng(it);
        it=it+1;
    end
end
temp=flipud(filtmat);
filtmat=[filtmat;temp(2:end,:)];
temp=fliplr(filtmat);
filtmat=[filtmat temp(:,2:end)];
filtmat(ceil(k1/2),ceil(k1/2))=sum(sum(filtmat))-filtmat(ceil(k1/2),ceil(k1/2));
filtmat(ceil(k1/2),ceil(k1/2))=-filtmat(ceil(k1/2),ceil(k1/2));
og1=i1;
pts=floor(k1./2);
for w1=1:p3
    for j=(pts+1):(size(i1,2)-pts-1)
        for i=(pts+1):(size(i1,1)-pts-1)
            pic=og1(i-pts:i+pts,j-pts:j+pts,w1);
            pic=double(pic);
            test=pic.*filtmat;
            test=sum(sum(test));
            i1(i,j,w1)=test;
        end
    end
end
i1=og1-i1;
end