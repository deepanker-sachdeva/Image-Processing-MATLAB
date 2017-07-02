%count each y for x
clear;
clc;
%closeall
i=double(rgb2gray(imread('gray.jpg')));

%i=double(rgb2gray(i));
% rgb2gray not req. as input is already gray
l=256;%no. of levels
n=zeros(l,1);%no. of each pixel i, but 0 i is mapped to 1st index.
cum=zeros(l,1);
new=zeros(l,1);
newn=zeros(l,1);
[r,c]=size(i);
for p=1:r
    for q=1:c
        n(i(p,q)+1)=n(i(p,q)+1)+1;% index 1 to 256
    end
end
for p=1:l
    if(p-1==0)
        cum(p)=n(p);
    else
        cum(p)=n(p)+cum(p-1);%if in the same n, then replace cum also with n
    end
end
totalPixels=r*c;
for p=1:l
    new(p)=round(cum(p)*(l-1)/totalPixels);
end
index=1;
while index<=256
    if(index==1)
        newn(new(index)+1)=n(index);
    else
        newn(new(index)+1)=newn(new(index))+n(index);
    end
    index=index+1;
end
equalized = uint8(zeros(r,c)); 
for p=1:r
    for q=1:c
        equalized(p,q)= new(i(p,q)+1);
    end
end

for m=1:256
    x(m)=m-1;%this is to plot bar between 0-255
end
subplot(2,2,1),imshow(uint8(i));
subplot(2,2,2),bar(x,n);
subplot(2,2,3),imshow(uint8(equalized),[]);
subplot(2,2,4),bar(x,newn);

% 
% figure,bar(x,newn);
% figure,bar(x,n);