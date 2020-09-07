function Ti=adaptivem_threshold_fn(i,N)
i=double(i);
out=zeros(size(i));
Ti=100.*ones(N,1);
for u=1:N
    Ti(u,1)=Ti(u,1)+(5.*u);
end
prevTi=Inf;
idx=zeros(size(i));
while abs(Ti-prevTi)>2
    for y=1:size(i,1)
        for x=1:size(i,2)
            for iloop=1:N
                if iloop==N
                    break;
                end
                if i(x,y)>Ti(iloop) && i(x,y)<=Ti(iloop+1)
                    idx(x,y)=iloop+1;
                end
                if iloop==1 && i(x,y)<=Ti(iloop)
                    idx(x,y)=iloop;
                end
            end
        end
    end
u=zeros(N+1,1);
for loop=1:N+1
    Irel=idx==loop-1;
    num=sum(sum(Irel));
    relel=Irel.*i;
    u(iloop,1)=sum(sum(relel));
    u(iloop,1)=u(iloop,1)/num;
end
prevTi=Ti;
for loop=1:N
    Ti(loop,1)=0.5*(u(loop)+u(loop+1));
end
end
disp(Ti)
end