clear;
clc;
%closeall
i=imread('gray.jpg');
i=rgb2gray(i);
[r,c]=size(i);
%figure,imshow(i);
%th=input('enter threshhold value: ');
j=zeros(size(i));
o=r;
p=1;
for m=1:r
    p=1;
    for n=1:c
        j(o,p)=i(m,n);
        p=p+1;
    end
    o=o-1;
end
j=uint8(j);
%figure,imshow(j);

subplot(2,1,1), imshow(i);
title('orig');
subplot(2,1,2), imshow(j);
title('vertical flipped');
% imwrite(i,'a.jpeg');