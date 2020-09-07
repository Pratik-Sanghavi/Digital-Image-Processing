function y=ideal_br_fil(i)
    i=double(i);
    I=fft2(i);
    Ish=fftshift(I);
    disp('Our methodology  will be to implement a band-reject filter to remove noise');
    disp('Use the "Measure Distance" tool to get approximate distances of noise band from central spectrum');
    prompt='Do you wish to display FFT of the image(Y/N)?:\n';
    k=input(prompt,'s');
    if k=='Y' || k=='y'
        Ishmag=abs(Ish);
        Ishmag=log2(1+Ishmag);
        Ishmag=mat2gray(Ishmag);
        Ishmag=threshold_fn(Ishmag);
        imtool(mat2gray(Ishmag));
    end
%     Input from user for filter specification
%     prompt='Enter lower limit on distance:\n';
%     D0=input(prompt);
%     prompt='Enter upper limit on distance:\n';
%     D1=input(prompt);
    matmax=max(max(Ishmag));
    for xr=1:size(Ishmag,1)
        for yr=1:size(Ishmag,2)
            if Ishmag(xr,yr)==matmax
                break;
            end
        end
    end
    %Generation of filter as per specification
    filtmat=zeros(size(Ish));
    xcent=floor(size(Ishmag,1)./2);
    ycent=floor(size(Ishmag,2)./2);
    xr2=2*xcent-xr;
    yr2=2*ycent-yr;
    for m=1:size(Ish,1)
        for n=1:size(Ish,2)
            if sqrt(((m-xr).^2)+((n-yr).^2))<5 || sqrt(((m-xr2).^2)+((n-yr2).^2))<5
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