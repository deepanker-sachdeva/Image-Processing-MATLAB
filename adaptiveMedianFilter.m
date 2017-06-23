clear;
clc;
image=double(rgb2gray(imread('emma.jpg')));
noise=imnoise(uint8(image),'salt & pepper',0.1);
figure,imshow(uint8(noise),[]);
sizeNbrx=3;
sizeNbry=3;
maxNbrx=11;
maxNbry=11;
[r,c]=size(noise);
noisy=zeros(r+10,c+10);
for i=6:r+5
    for j=6:c+5
        noisy(i,j)=noise(i-5,j-5);
    end
end
flag=0;
new=zeros(r,c);
%cnt=0;
for i=6:r+5
    for j=6:c+5
% for i=4:5
%     for j=4:5
        %cnt=cnt+1;
        flag=0;
        sizeNbrx=3;
        sizeNbry=3;
        while(flag==0)
            S=getNbrhd(noisy,i,j,sizeNbrx,sizeNbry);
            med=median(S(:));
            mini=min(S(:));
            maxi=max(S(:));
            A=med-mini;
            B=med-maxi;
            if((A>0)&&(B<0))
                C=noisy(i,j)-mini;
                D=noisy(i,j)-maxi;
                if((C>0)&&(D<0))
                    answer=noisy(i,j);
                    flag=1;
                else
                    answer=med;
                    flag=1;
                end
            else
                sizeNbrx=sizeNbrx+2;
                sizeNbry=sizeNbry+2;
                if(sizeNbrx>maxNbrx || sizeNbry>maxNbry)
                    flag=1;
                    answer=med;
                else
                    flag=0;
                end
            end
        end
        new(i-5,j-5)=answer;
    end
end
figure,imshow(uint8(new));
%psnauto=psnr(uint8(image),uint8(noise));
s=0;
m=zeros(1,1,'double');
noise=double(noise);
image=double(image);

for i=1:r
    for j=1:c
        k=((image(i,j)-new(i,j))^2);
        m=m+double(k);
    end
end
 m=m/(r*c);
 p=10*log10((255*255)/(m));
 
 mse=immse((image),double(new));
 psnrofimage=10*log((255*255)/(mse))/log(20);
