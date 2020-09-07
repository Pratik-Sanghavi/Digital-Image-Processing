function y=median_fil(inoise,N)
y=inoise;
pts=floor(N./2);
for j=(pts+1):(size(inoise,2)-pts-1)
    for i=(pts+1):(size(inoise,1)-pts-1)
        pic=inoise(i-pts:i+pts,j-pts:j+pts);
        pic=pic(:);
        pic=sort(pic);
        y(i,j)=pic(ceil(length(pic)/2));
    end
end
y=uint8(y);
end