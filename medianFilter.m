% median filter , applied on salt % pepper
image=double(rgb2gray(imread('emma.jpg')));
[m,n]=size(image);
Pa=.05;%pepper
Pb=.05;%salt probability
noisy=saltPepper(image,Pa,Pb);
sizeNbrx=3;
sizeNbry=3;
S=zeros(sizeNbrx,sizeNbry);
median=zeros(m,n);
for i=1:m
    for j=1:n
        S=getNbrhd(noisy,i,j,sizeNbrx,sizeNbry);
        sorted=sort(S(:));
        median(i,j)=sorted(round((sizeNbrx*sizeNbry)/2));
    end
end
figure,imshow(uint8(noisy));
figure,imshow(uint8(median));