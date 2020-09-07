function out=adaptive_threshold_fn(i)
out=zeros(size(i));
Ti=200;
prevTi=Ti+10;
len=length(i(:));
G1=zeros(len,1);
G2=zeros(len,1);
while abs(Ti-prevTi)>2
    k1=1;
    k2=1;
    for y=1:size(i,1)
        for x=1:size(i,2)
            if i(y,x)>Ti
                G1(k1,1)=i(y,x);
                k1=k1+1;
            else
                G2(k2,1)=i(y,x);
                k2=k2+1;
            end
        end
    end
G1=G1(1:k1-1);
G2=G2(1:k2-1);
u1=sum(G1(:))/length(G1);
u2=sum(G2(:))/length(G2);
prevTi=Ti;
Ti=(u1+u2)/2;
end
disp(Ti);
for y=1:size(i,1)
    for x=1:size(i,2)
        if i(y,x)>Ti
            out(y,x)=1;
        else
            out(y,x)=0;
        end
    end
end
end