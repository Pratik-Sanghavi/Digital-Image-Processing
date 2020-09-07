function i1=shpfilter(i1,dim)
if dim==3
    p3=3;
else
    p3=1;
end
og1=i1;
k1=3;
pts=floor(k1./2);
for w1=1:p3
    for j=(pts+1):(size(i1,2)-pts-1)
        for i=(pts+1):(size(i1,1)-pts-1)
            pic=og1(i-pts:i+pts,j-pts:j+pts,w1);
            test=pic(1,2)+pic(2,1)+pic(2,3)+pic(3,2)-(4*pic(2,2));
            i1(i,j,w1)=test;
        end
    end
end
end