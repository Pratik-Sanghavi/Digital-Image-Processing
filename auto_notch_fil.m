function y=auto_notch_fil(i,Du)
    i=double(i);
    I=fft2(i);
    Ish=fftshift(I);
    disp('Our methodology  will be to implement a notch filter to remove noise');
    prompt='Do you wish to display FFT of the image(Y/N)?:\n';
    k=input(prompt,'s');
    Ishmag=abs(Ish);
    Ishmag=log2(1+Ishmag);
    Ishmag=mat2gray(Ishmag);
    Ishmag=threshold_fn(Ishmag);
    if k=='Y' || k=='y'
        imshow(mat2gray(Ishmag));
        tran=input('Press enter\n','s');
    end
    dim1=size(Ish,1);
    dim2=size(Ish,2);
    centx=dim1/2;
    centy=dim2/2;
    matmax=max(max(Ishmag));
    indices=zeros(max([size(Ish,1) size(Ish,2)]),2);
    itr=1;
    for xr=1:size(Ishmag,1)
        for yr=1:size(Ishmag,2)
            if Ishmag(xr,yr)==matmax && sqrt(((xr-centx).^2)+((yr-centy).^2))>4*Du
                indices(itr,1)=xr;
                indices(itr,2)=yr;
                itr=itr+1;
            end
        end
    end
    itr=itr-1;
    indices=indices(1:itr,:);
    %Generation of filter as per specification
    filtmat=ones(size(Ish));
    for it1=1:itr
        xr=indices(it1,1);
        yr=indices(it1,2);
        xr2=(2*centx)-xr;
        yr2=(2*centy)-yr;
    for m=1:size(Ish,1)
        for n=1:size(Ish,2)
            if sqrt(((m-xr).^2)+((n-yr).^2))<Du || sqrt(((m-xr2).^2)+((n-yr2).^2))<Du
                filtmat(m,n)=0;
            end
        end
    end
    end
    Y=filtmat.*Ish;
    Y=ifftshift(Y);
    y=ifft2(Y);
    y=uint8(abs(y));
end