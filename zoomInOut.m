clear;
clc;
i=imread('gray.jpg');
i=rgb2gray(i);
[r,c]=size(i);
figure,imshow(i);
R=2*r;
C=2*c;

j=zeros(R,C);
%this is with doubling the pixels with a factor of 2
for m=1:r
    for n=1:c
        j(2*m-1,2*n-1)=i(m,n);
        j(2*m-1,2*n)=i(m,n);
        j(2*m,2*n-1)=i(m,n);
        j(2*m,2*n)=i(m,n);
    end 
end

k=zeros(r,c);
for m=1:r
    s=0;
    for n=1:c
        s=j(2*m-1,2*n-1)+j(2*m-1,2*n)+j(2*m,2*n-1)+j(2*m,2*n);
        s=s/4;
        k(m,n)=s;
    end 
end

figure,imshow(uint8(j));
figure,imshow(uint8(k));
% subplot(2,1,1), imshow(i);
% title('orig');
% subplot(2,1,2), imshow(j);
% title('zoomed in');

% imwrite(i,'a.jpeg');