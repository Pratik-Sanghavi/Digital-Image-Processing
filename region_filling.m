%% User input
prompt='Please enter choice of image:\n';
k=input(prompt,'s');
i=imread(k);
i=rgb2gray(i);
i=imbinarize(i);
i=~i;
%% Processing
% s=ones(3,3);
% imer=imerode(i,s);
% imb=i-imer;
%% Region Growing
M=~i;
Xadv=zeros(size(i));
kon='y';
imfil=i;
while kon=='y' || kon=='Y'
Xadv=zeros(size(i));    
imtool(imfil);
y1=input('Enter value for initial point row:\n');
x1=input('Enter value for initial point column:\n');
Xadv(y1,x1)=1;
s=[0 1 0;1 1 1;0 1 0];
Xprev=ones(size(i));
while 1
    Xprev=Xadv;
    Xadv=imdilate(Xprev,s);
    Xadv=Xadv.*M;
    if Xadv==Xprev
        break
    end
end
imfil=i+Xadv;
imshow(~imfil);
kon=input('Do you wish to continue?','s');
end
%% Display output
subplot(121)
imshow(i)
subplot(122)
imshow(~imfil)