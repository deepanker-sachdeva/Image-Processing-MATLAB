%f(x,y) in a range then set 255 all others same------intensity slicing with background
%as for without background----others set as 0
clear;
clc;
%closeall
i=imread('gray.jpg');
i=double(rgb2gray(i));
[r,c]=size(i);
d=input('enter a range of intensity values, between which intensity slicing will be done ');
q=input('');
j=zeros(size(i));
k=j;
for m=1:r
    for n=1:c
        if((i(m,n)>=d)&&(i(m,n)<=q))
            j(m,n)=255;
            k(m,n)=255;
        else
            k(m,n)=i(m,n);
            j(m,n)=0;
        end
    end
end

k=uint8(k);
j=uint8(j);
i=uint8(i);
subplot(2,2,1), imshow(i);
title('orig');
subplot(2,2,2), imshow(j,[]);
title('Intensity Slicing without background');
subplot(2,2,3), imshow(k,[]);
title('Intensity Slicing with background');