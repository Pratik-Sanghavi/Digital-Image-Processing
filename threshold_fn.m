function out=threshold_fn(i)
out=zeros(size(i));
mmax=max(max(i));
mmin=min(min(i));
    for y=1:size(i,1)
        for x=1:size(i,2)
            if i(y,x)>mmax-0.3
                out(y,x)=mmax;
            else
                out(y,x)=mmin;
            end
        end
    end
end