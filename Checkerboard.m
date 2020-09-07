m=ones(139,139);
m(:,1:44)=0;
m(:,96:139)=0;
k1=39;
pts=floor(k1./2);
for j=(pts+1):(size(m,2)-pts-1)
    for i=(pts+1):(size(m,1)-pts-1)
        pic=m(i-pts:i+pts,j-pts:j+pts);
        test=sum(sum(pic));
        test=test./(k1.^2);
        m(i,j)=test;
    end
end
m=m(20:119,20:119);
im=zeros(400,400);
im(1:100,1:100)=m;
im(1:100,201:300)=m;
im(101:200,101:200)=m;
im(101:200,301:400)=m;
im(201:300,1:100)=m;
im(201:300,201:300)=m;
im(301:400,101:200)=m;
im(301:400,301:400)=m;
imshow(im);