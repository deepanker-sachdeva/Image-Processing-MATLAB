% mean filter to remove gaussian noise
clear;
clc;

mean=50;
variance=10;
image=double(rgb2gray(imread('emma.jpg')));
q=0;
for t=1:346
    for o=1:461
        q=q+image(t,o);
    end
end
q=q/(360*576)


%noisy=gaussianNoise(image,mean,variance);
noisy=imnoise(uint8(image),'gaussian',0,0.01);

% mean filter
[m,n]=size(noisy);
% S is neighbourhood, x,y its size
sizeNbrx=3;
sizeNbry=3;
meanImage=zeros(size(noisy));
for x=1:m
    for y=1:n
        S=getNbrhd(noisy,x,y,3,3);
        s=zeros(1,1);
        for k=1:sizeNbrx
            for l=1:sizeNbry
                s=s+S(k,l);
            end
        end
        meanImage(x,y)=s/(sizeNbrx*sizeNbry);
    end
end

figure,imshow(uint8(noisy),[]);
figure,imshow(uint8(meanImage),[]);
title('Applied Avg. Filter')