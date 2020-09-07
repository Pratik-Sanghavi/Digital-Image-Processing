function p=prob_mat(im)
im=double(im);
p=zeros(1,256);
for j=1:size(im,2)
   for i=1:size(im,1)
       t=im(i,j);
       p(1,t+1)=p(1,t+1)+1;
   end
end 
tot=sum(p);
p=p./tot;
end