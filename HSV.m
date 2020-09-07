i=imread('grandcanyonhaze530.jpg');
t=rgb2hsv(i);
imshow(t);
subplot(121);
imshow(i);
subplot(122)
imshow(t);
