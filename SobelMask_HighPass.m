clear;
clc;
i=double(rgb2gray(imread('gray.jpg')));
%i=double(imread('testgray.jpg'));

% rgb2gray not req. as input is already gray
[r,c]=size(i);
j=zeros(r+2,c+2);
gx=zeros(r,c);
gy=zeros(r,c);
g=zeros(r,c);
h=zeros(r,c);
for p=2:r+1
    for q=2:c+1
        j(p,q)=i(p-1,q-1);
    end
end
for p=2:r+1
    for q=2:c+1
        gx(p-1,q-1)=-j(p-1,q-1)-2*j(p-1,q)-j(p-1,q+1)+j(p+1,q-1)+2*j(p+1,q)+j(p+1,q+1);
        gy(p-1,q-1)=-j(p-1,q-1)-2*j(p,q-1)-j(p+1,q-1)+j(p-1,q+1)+2*j(p,q+1)+j(p+1,q+1);
        g(p-1,q-1)=sqrt(gx(p-1,q-1)^2+gy(p-1,q-1)^2);
        %h(p-1,q-1)=-g(p-1,q-1)+i(p-1,q-1);
    end
end
%h=uint8(h);
i=uint8(i);
j=uint8(j);
g=uint8(g);
subplot(2,2,1), imshow(i);
title('Original');
subplot(2,2,2), imshow(g,[]);
title('Sobel Sharpened Edges');
subplot(2,2,3), imshow(uint8(gx),[]);
title('Sobel Horizontal Sharpened Edges');
subplot(2,2,4), imshow(uint8(gy),[]);
title('Sobel Vertical Sharpened Edges');
