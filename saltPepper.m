% salt & pepper. things commented will work if this file is not a function
% itself
function[noisy]=saltPepper(image,Pa,Pb)
%Pa=.05;
%Pb=.05;
%image=double(rgb2gray(imread('emma.jpg')));
[m,n]=size(image);
noise=rand(m,n);
noisy=zeros(m,n);
for i=1:m
    for j=1:n
        if(noise(i,j)<Pa)
            noisy(i,j)=0;
        else if(noise(i,j)>(1-Pb))
                noisy(i,j)=255;
            else
                noisy(i,j)=image(i,j);
            end
        end
    end
end
% image=uint8(image);
% noisy=uint8(noisy);
% figure,imshow(image);
% figure,imshow(noisy);


% using inbuilt method
% p=.1;
% X = imnoise(uint8(image), 'salt & pepper', p);
% 
% figure,imshow(X);
end