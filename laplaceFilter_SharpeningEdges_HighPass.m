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
z=zeros(r,c);
% here 3*3 weighted avg. filter mask is to be applied
%making the gaussian mask
x=1;
y=1;
for p=1:3
    for q=1:3
        if(p-q==0 && p==2)
        m(x,y)=-4;
        else
            if(abs(p-q)==1)
                m(x,y)=1;
            else
                m(x,y)=0;
            end
        end
        y=y+1;
    end
    x=x+1;
    y=1;
end
for p=2:r+1
    for q=2:c+1
        z(p-1,q-1)=(m(1,1)*j(p-1,q-1)+m(1,2)*j(p-1,q)+m(1,3)*j(p-1,q+1)+m(2,1)*j(p,q-1)+m(2,2)*j(p,q)+m(2,3)*j(p,q+1)+m(3,2)*j(p+1,q)+m(3,1)*j(p+1,q-1)+m(3,3)*j(p+1,q+1));
    end
end
%laplace not divide by sum
i=uint8(i);
j=uint8(j);
z=uint8(z);
subplot(2,2,1), imshow(i);
title('orig');
subplot(2,2,2), imshow(j,[]);
title('with border');
subplot(2,2,3), imshow(z,[]);
title('laplace filter 4 mask');

j=double(j);
x=1;
y=1;
for p=1:3
    for q=1:3
        if(p-q==0 & p==2)
        m(x,y)=-8;
        else
            m(x,y)=1;
        end
        y=y+1;
    end
    x=x+1;
    y=1;
end
x=zeros(r,c);
for p=2:r+1
    for q=2:c+1
        x(p-1,q-1)=(m(1,1)*j(p-1,q-1)+m(1,2)*j(p-1,q)+m(1,3)*j(p-1,q+1)+m(2,1)*j(p,q-1)+m(2,2)*j(p,q)+m(2,3)*j(p,q+1)+m(3,2)*j(p+1,q)+m(3,1)*j(p+1,q-1)+m(3,3)*j(p+1,q+1));
    end
end

i=uint8(i);
j=uint8(j);
x=uint8(x);
subplot(2,2,4), imshow(x,[]);
title('laplace filter 8 mask');
