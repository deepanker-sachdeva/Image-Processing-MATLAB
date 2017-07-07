clear;
clc;
i=double(rgb2gray(imread('gray.jpg')));
[r,c]=size(i);
j=zeros(r+1,c+1);
for m=1:r
    for n=1:c
        j(m,n)=i(m,n);
    end
end
gx=zeros(r,c);
gy=zeros(r,c);
mask=zeros(r,c);
for m=1:r
    for n=1:c
        gx(m,n)=j(m,n+1)-j(m,n);
        gy(m,n)=j(m+1,n)-j(m,n);
        mask(m,n)=sqrt(((gx(m,n)*gx(m,n))+(gy(m,n)+gy(m,n))));
    end
end
new=zeros(r,c);
for m=1:r
    for n=1:c
        new(m,n)=mask(m,n)*i(m,n);
    end
end
i=uint8(i);
mask=uint8(mask);
new=uint8(new);
subplot(2,2,1), imshow(i);
title('Original');
subplot(2,2,2), imshow(mask,[]);
title('Mask');
subplot(2,2,3), imshow(new,[]);
title('Linear Gradient Applied');
