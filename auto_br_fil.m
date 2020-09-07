function y=auto_br_fil(i,Du)
    i=double(i);
    I=fft2(i);
    Ish=fftshift(I);
    disp('Our methodology  will be to implement a band-reject filter to remove noise');
    prompt='Do you wish to display FFT of the image(Y/N)?:\n';
    k=input(prompt,'s');
    Ishmag=abs(Ish);
    Ishmag=log2(1+Ishmag);
    Ishmag=mat2gray(Ishmag);
    Ishmag=threshold_fn(Ishmag);
    if k=='Y' || k=='y'
        imtool(mat2gray(Ishmag));
    end
    flag=0;
    matmax=max(max(Ishmag));
    for xr=1:size(Ishmag,1)
        for yr=1:size(Ishmag,2)
            if Ishmag(xr,yr)==matmax
                flag=1;
                break;
            end
        end
        if flag==1
            break
        end
    end
    %Generation of filter as per specification
    filtmat=zeros(size(Ish));
    dim1=size(Ish,1);
    dim2=size(Ish,2);
    centx=dim1/2;
    centy=dim2/2;
    distg=sqrt(((yr-centy).^2)+((xr-centx).^2));
    distl=distg-Du;
    distu=distg+Du;
    for m=1:size(Ish,1)
        for n=1:size(Ish,2)
            if sqrt(((m-centx).^2)+((n-centy).^2))<distl || sqrt(((m-centx).^2)+((n-centy).^2))>distu
                filtmat(m,n)=1;
            else
                filtmat(m,n)=0;
            end
        end
    end
    Y=filtmat.*Ish;
    Y=ifftshift(Y);
    y=ifft2(Y);
    y=uint8(y);
end