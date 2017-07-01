function[S]=getNbrhd(image,x,y,sizeNbrx,sizeNbry)
S=zeros(sizeNbrx,sizeNbry);
[sizeX,sizeY]=size(image);
a=(sizeNbrx-1)/2;
b=(sizeNbry-1)/2;
for i=-a:a
    for j=-b:b
        if(i+x<1 || j+y<1 || i+x>sizeX||j+y>sizeY)
            S(i+a+1,j+b+1)=0;
        else
            S(i+a+1,j+b+1)=image(i+x,j+y);
    end
end
end