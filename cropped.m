clear;
clc;
%closeall
i=imread('gray.jpg');
i=rgb2gray(i);
[r,c]=size(i);
%figure,imshow(i);

x1=input('enter x1 value: ');
y1=input('enter y1 value: ');
x2=input('enter x2 value: ');
y2=input('enter y2 value: ');

j=zeros(y2-y1+1,x2-x1+1);
o=1;
p=1;
for m=y1:y2
    p=1;
    for n=x1:x2
        j(o,p)=i(m,n);
        p=p+1;
    end
    o=o+1;
end
j=uint8(j);
%figure,imshow(j);

subplot(2,1,1), imshow(i);
title('orig');
subplot(2,1,2), imshow(j);
title('Cropped');
% imwrite(i,'a.jpeg');