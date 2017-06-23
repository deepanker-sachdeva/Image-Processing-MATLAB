% mean filter to remove gaussian noise
mean=50;
variance=5;
image=double((imread('testgray.jpg')));
noisy=gaussianNoise(image,mean,variance);
% mean filter
[m,n]=size(noisy);
% S is neighbourhood, x,y its size
sizeNbrx=3;
sizeNbry=3;
S=zeros(sizeNbrx,sizeNbry);
%variance of noise, varNoise 
varNoise=input('Enter value of variance of noise!');
%newImage is the resultant adaptive mean filter's image
newImage=zeros(size(noisy));
for x=1:m
    for y=1:n
        S=getNbrhd(noisy,x,y,sizeNbrx,sizeNbry);
        s=zeros(1,1);
        for k=1:sizeNbrx
            for l=1:sizeNbry
                s=s+S(k,l);
            end
        end
        meanNbrhd=s/(sizeNbrx*sizeNbry);
        varNbrhd=std(reshape(S,sizeNbrx*sizeNbry,1)).^2;%reshape convert 2d to 1d, and std calculates standard deviation
        %see the problem std formula etc.
        cal=varNoise/varNbrhd;
        if(cal>1)
            cal=1;
        end
        newImage(x,y)=noisy(x,y)-cal*(noisy(x,y)-meanNbrhd);
    end
end

figure,imshow(uint8(noisy));
figure,imshow(uint8(newImage));
title('Adaptive mean Filter')