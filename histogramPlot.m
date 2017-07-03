%bar(x,y)
%count each y for x
clear;
clc;
%closeall
i=double(imread('testgray.jpg'));

%i=double(rgb2gray(i));
% rgb2gray not req. as input is already gray
intensity=zeros(256,1);
[r,c]=size(i);
for m=1:r
    for n=1:c
        intensity(i(m,n)+1)=intensity(i(m,n)+1)+1;%plotting in bar and hist starts at index 1 to 256
    end
end
for m=1:256
    x(m)=m-1;%this is to plot bar between 0-255
end
bar(x,intensity);