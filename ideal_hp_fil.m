function y=ideal_hp_fil(i,D0)
    i=double(i);
    I=fft2(i);
    Ish=fftshift(I);
    %Generation of filter as per specification
    filtmat=zeros(size(Ish));
    dim1=size(Ish,1);
    dim2=size(Ish,2);
    centx=dim2/2;
    centy=dim1/2;
    for m=1:size(Ish,1)
        for n=1:size(Ish,2)
            if sqrt(((m-centy).^2)+((n-centx).^2))<D0
                filtmat(m,n)=0;
            else
                filtmat(m,n)=1;
            end
        end
    end
    Y=filtmat.*Ish;
    Y=ifftshift(Y);
    y=ifft2(Y);
    y=uint8(y);
end