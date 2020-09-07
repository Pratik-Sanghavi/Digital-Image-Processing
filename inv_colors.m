i=imread('TS.jpeg');
igray=rgb2gray(i);
ibin=imbinarize(igray);
s=strel('diamond',1);
s2=strel('diamond',2);
io=imdilate(ibin,s);
ier=imerode(io,s2);
imshow(ier);