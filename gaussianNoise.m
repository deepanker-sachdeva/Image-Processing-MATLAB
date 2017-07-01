%gaussian noise
function[new]=gaussianNoise(i,mean,variance)
%clear;
%clc;
[inputx,inputy]=size(i);
m=inputx;
n=inputy;
%mean=50;
%variance=10;
a=mean;
b=variance;
z=a+b*randn(m,n);
new=z+i;
index=zeros(256,1);
for j=1:256
    index(j)=j-1;
end
cnt=zeros(256,1);
z=uint8(z);
for k=1:m
    for l=1:n
        cnt(z(k,l)+1)=cnt(z(k,l)+1)+1;
    end
end
i=uint8(i);
new=z+i;% added noise
figure,subplot(2,2,1),imshow(uint8(i));
title('Original');
subplot(2,2,2),bar(index,cnt);
title('Gaussian Histogram');
subplot(2,2,3),imshow(uint8(z));
title('Gaussian Noise');
subplot(2,2,4),imshow(new);
title('Adding Gaussian Noise');
end
% now removing noise
% use avg. filter
% new sent to other file