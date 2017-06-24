clear;
clc;
i=double(rgb2gray(imread('gray.jpg')));
% rgb2gray not req. as input is already gray
[r,c]=size(i);
j=zeros(r+2,c+2);
for p=2:r+1
    for q=2:c+1
        j(p,q)=i(p-1,q-1);
    end
end
z=zeros(r,c);
% here 3*3 avg. filter mask is to be applied
for p=2:r+1
    for q=2:c+1
        z(p-1,q-1)=(j(p-1,q-1)+j(p,q-1)+j(p,q+1)+j(p-1,q)+j(p,q)+j(p+1,q)+j(p-1,q+1)+j(p+1,q-1)+j(p+1,q+1))/9;
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
title('avg. filter');
figure,imshow(i);
figure,imshow(z);