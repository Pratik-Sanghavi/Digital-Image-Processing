function y=homomorphic_fil(i,D0,lowg,highg)
    i=double(i);
    D0=D0^2;
    diff=highg-lowg;
    i=i+1; %%avoiding log(0) value which is undefined
    z=log(i);
    I=fft2(z);
    w=size(I,3);
    if w==3
        w=3;
    else
        w=1;
    end
    %Generation of filter as per specification
    filtmat=zeros(size(I));
    dim1=size(I,1);
    dim2=size(I,2);
    centx=dim2/2;
    centy=dim1/2;
    %Implementation of Gaussian HP filter
    for p=1:w
        for m=1:size(I,1)
            for n=1:size(I,2)
                dist=((m-centy)^2)+((n-centx)^2);
                pow=dist/(2*D0);
                filtmat(m,n)=exp(-pow);
                filtmat(m,n)=1-filtmat(m,n);
            end
        end
    end
    for p=1:w
        for m=1:size(I,1)
            for n=1:size(I,2)
                filtmat(m,n)=(diff.*filtmat(m,n))+lowg;
            end
        end
    end
    Y=I.*filtmat;
    ifim=ifft2(Y);
    y=exp(ifim);
    y=uint8(y);
end