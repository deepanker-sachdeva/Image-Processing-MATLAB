% mean filter to remove gaussian noise
clear;
clc;
image=double(rgb2gray(imread('emma.jpg')));
[m,n]=size(image);
Pa=.05;%pepper
Pb=.05;%salt probability
noisy=saltPepper(image,Pa,Pb);
sizeNbrx=3;
sizeNbry=3;
S=zeros(sizeNbrx,sizeNbry);
%d, how much to trim the nbrhd, so input d
d=input('Enter value of d (how much to trim the neighbourhood?)(in integer)');
%newImage is the resultant alpha trimmed image
newImage=zeros(size(noisy));
for x=1:m
    for y=1:n
        S=getNbrhd(noisy,x,y,sizeNbrx,sizeNbry);
        sorted=sort(S(:));
        frontd=idivide(int32(d),2);
        backd=d-frontd;
        siz=size(sorted);
        trimmedNbrhd=sorted((1+frontd):siz(1)-backd);
        sizeTrim=size(trimmedNbrhd);
        s=zeros(1,1);
        for k=1:sizeTrim(1)
            s=s+trimmedNbrhd(k,1);
        end
        newImage(x,y)=s/(sizeTrim(1));
    end
end

figure,imshow(uint8(noisy));
figure,imshow(uint8(newImage));
title('Applied alpha trimmed mean Filter')