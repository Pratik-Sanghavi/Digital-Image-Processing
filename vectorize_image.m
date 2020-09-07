function y=vectorize_image(im,thres,avg)
im=double(im);
dim=size(im,3);
if dim==3
    dim1=3;
else
    dim1=1;
end
nreg=floor(256/thres);
nreg=nreg-1;
reg=zeros(nreg,1);
p=0;
ic=1;
while(p<nreg*thres)
   p=p+thres;
   reg(ic)=p;
   ic=ic+1;
end

for w1=1:dim1
   for  i=1:size(im,1)
       for j=1:size(im,2)
          for opc=1:nreg-1
             if(opc==1 && im(i,j,w1)<reg(opc))
                 im(i,j,w1)=0;
                 break
             end
             if (opc>1 && opc~=1 && opc~=nreg-1 && im(i,j,w1)>reg(opc) && im(i,j,w1)<reg(opc+1))
                 im(i,j,w1)=reg(opc);
                 
             end
             if (opc==nreg-1 && im(i,j,w1)>reg(opc))
                 im(i,j,w1)=255;
             end
          end    
       end
   end
end
end
imtool(im);
k1=input('Enter starting point');
k2=input('Enter end point');
imavg=im(k1(1,1):k2(1,1),k1(1,2):k2(1,2),:);
imavg=avgfilter(imavg,avg,dim1);
y(k1(1,1):k2(1,1),k1(1,2):k2(1,2),:)=imavg;
end