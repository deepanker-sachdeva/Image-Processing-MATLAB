clear;
clc;
i=double(rgb2gray(imread('gray.jpg')));
%i=double(imread('testgray.jpg'));

% rgb2gray not req. as input is already gray
[r,c]=size(i);
j=zeros(r+2,c+2);
for p=2:r+1
    for q=2:c+1
        j(p,q)=i(p-1,q-1);
    end
end
x=1;
y=1;
%m is prewitt 135 45 degree mask
%n is Sobel 135 45 degree mask
m1=zeros(3,3);
m2=zeros(3,3);
n1=zeros(3,3);
n2=zeros(3,3);
for p=1:3
    for q=1:3
        if(p-q==0)
            m1(x,y)=0;
        else
            if(p-q<0)
                m1(x,y)=-1;
            else
                m1(x,y)=1;
            end
        end
        y=y+1;
    end
    x=x+1;
    y=1;
end
x=1;
y=1;
for p=1:3
    for q=1:3
        if(p-q==0)
            n1(x,y)=0;
        else
            if(p-q<0)
                if(abs(p-q)>1)
                    n1(x,y)=-2;
                else
                    n1(x,y)=-1;
                end
            else
                if(abs(p-q)>1)
                    n1(x,y)=2;
                else
                    n1(x,y)=1;
                end
            end
        end
        y=y+1;
    end
    x=x+1;
    y=1;
end
m2(1,1)=-1;
m2(1,2)=-1;
m2(1,3)=0;
m2(2,1)=-1;
m2(2,2)=0;
m2(2,3)=1;
m2(3,1)=0;
m2(3,2)=1;
m2(3,3)=1;

n2(1,1)=-2;
n2(1,2)=-1;
n2(1,3)=0;
n2(2,1)=-1;
n2(2,2)=0;
n2(2,3)=1;
n2(3,1)=0;
n2(3,2)=1;
n2(3,3)=2;

z1=zeros(r,c);
z2=zeros(r,c);
x1=zeros(r,c);
x2=zeros(r,c);
for p=2:r+1
    for q=2:c+1
        z1(p-1,q-1)=(m1(1,1)*j(p-1,q-1)+m1(1,2)*j(p-1,q)+m1(1,3)*j(p-1,q+1)+m1(2,1)*j(p,q-1)+m1(2,2)*j(p,q)+m1(2,3)*j(p,q+1)+m1(3,2)*j(p+1,q)+m1(3,1)*j(p+1,q-1)+m1(3,3)*j(p+1,q+1));
        z2(p-1,q-1)=(m2(1,1)*j(p-1,q-1)+m2(1,2)*j(p-1,q)+m2(1,3)*j(p-1,q+1)+m2(2,1)*j(p,q-1)+m2(2,2)*j(p,q)+m2(2,3)*j(p,q+1)+m2(3,2)*j(p+1,q)+m2(3,1)*j(p+1,q-1)+m2(3,3)*j(p+1,q+1));
        x1(p-1,q-1)=(n1(1,1)*j(p-1,q-1)+n1(1,2)*j(p-1,q)+n1(1,3)*j(p-1,q+1)+n1(2,1)*j(p,q-1)+n1(2,2)*j(p,q)+n1(2,3)*j(p,q+1)+n1(3,2)*j(p+1,q)+n1(3,1)*j(p+1,q-1)+n1(3,3)*j(p+1,q+1));
        x2(p-1,q-1)=(n2(1,1)*j(p-1,q-1)+n2(1,2)*j(p-1,q)+n2(1,3)*j(p-1,q+1)+n2(2,1)*j(p,q-1)+n2(2,2)*j(p,q)+n2(2,3)*j(p,q+1)+n2(3,2)*j(p+1,q)+n2(3,1)*j(p+1,q-1)+n2(3,3)*j(p+1,q+1));
    end
end
i=uint8(i);
j=uint8(j);
z1=uint8(z1);
z2=uint8(z2);
x1=uint8(x1);
x2=uint8(x2);
subplot(2,3,1), imshow(i);
title('orig');
subplot(2,3,2), imshow(j,[]);
title('with border');
subplot(2,3,3), imshow(z1,[]);
title('Gradient Filter 135 (Prewitt) degree');
subplot(2,3,4), imshow(z2,[]);
title('Gradient Filter 45 (Prewitt) degree');
subplot(2,3,5), imshow(x1,[]);
title('Gradient Filter 135 (Sobel) degree');
subplot(2,3,6), imshow(x2,[]);
title('Gradient Filter 45 (Sobel) degree');
