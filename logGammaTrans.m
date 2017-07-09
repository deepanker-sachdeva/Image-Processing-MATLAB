clear;
clc;
%closeall
i=imread('gray.jpg');
%log transformation takes image in double format
i=double(rgb2gray(i));
[r,c]=size(i);
%figure,imshow(i);
d=input('enter value of c for log transformation: ');
q=input('enter value of c for gamma transformation: ');
gamma=input('enter value of gamma: ');

j=zeros(size(i));
for m=1:r
    for n=1:c
        j(m,n)=d*log10(1+i(m,n));
    end
end

k=zeros(size(i));
for m=1:r
    for n=1:c
        k(m,n)=q*(i(m,n)^gamma);
    end
end
k=uint8(k);
j=uint8(j);
%figure,imshow(j);
i=uint8(i);
subplot(2,2,1), imshow(i);
title('orig');
subplot(2,2,2), imshow(j,[]);
title('Log Transformation');
subplot(2,2,3), imshow(k,[]);
title('Gamma Transformation');
% imwrite(i,'a.jpeg');