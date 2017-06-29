clear;
clc;
i=double(rgb2gray(imread('gray.jpg')));
%i=double(imread('testgray.jpg'));

% rgb2gray not req. as input is already gray
[r,c]=size(i);
j=zeros(r+2,c+2);
for p=2:r+1
    for q=2:c+1
        j(p,q)=i(p-1,q-1);
    end
end
z=zeros(r,c);
% here 3*3 weighted avg. filter mask is to be applied
%making the gaussian mask
sigma=1;
x=1;
y=1;
m=zeros(3,3);
for p=-1:1
    for q=-1:1
        m(x,y)=exp(-((p*p)+(q*q))/(2*sigma*sigma));
        y=y+1;
    end
    x=x+1;
    y=1;
end
s=0;
for p=1:3
    for q=1:3
        s=s+m(p,q);
    end
end
for p=2:r+1
    for q=2:c+1
        z(p-1,q-1)=(m(1,1)*j(p-1,q-1)+m(1,2)*j(p-1,q)+m(1,3)*j(p-1,q+1)+m(2,1)*j(p,q-1)+m(2,2)*j(p,q)+m(2,3)*j(p,q+1)+m(3,2)*j(p+1,q)+m(3,1)*j(p+1,q-1)+m(3,3)*j(p+1,q+1))/s;
    end
end

i=uint8(i);
j=uint8(j);
z=uint8(z);
subplot(2,2,1), imshow(i);
title('orig');
subplot(2,2,2), imshow(j,[]);
title('with border');
subplot(2,2,3), imshow(z,[]);
title('gaussian filter');
%figure,imshow(i);
%figure,imshow(z);