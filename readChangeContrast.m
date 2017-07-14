i=imread('j.jpg');
i=rgb2gray(i);
[r,c]=size(i);
figure,imshow(i);
th=input('enter threshhold value: ');

for m=1:r
    for n=1:c
        if(i(m,n)<=th)
            i(m,n)=0;
        else
            i(m,n)=255;
        end
    end
end
figure,imshow(i);
imwrite(i,'a.jpeg');