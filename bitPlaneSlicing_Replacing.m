clear;
clc;
%closeall
i=rgb2gray(imread('emma.jpg'));
new=rgb2gray(imread('gray.jpg'));
new=im2bw(new);
new=imresize(new,size(i));
%here idivide only works on int, so dont convert it into double
%b1    i%2---> 0,1/2=b1
%b2    i%4---> 0,1,2,3/4=b2
%b n   i%2^n---> 0,1,...n-1/2^n-1

[r,c]=size(i);
b=zeros(r,c,8);
% for m=1:8
%     b[m]=zeros(size(i));
% end
% b[1]=zeros(size(i));
% b[2]=zeros(size(i));
% b3=zeros(size(i));
% b4=zeros(size(i));
% b5=zeros(size(i));
% b6=zeros(size(i));
% b7=zeros(size(i));
% b8=zeros(size(i));

for m=1:r
    for n=1:c
        for o=1:8
            tempi=i(m,n);
            temp=mod(tempi,power(2,o));
            b(m,n,o)=idivide(temp,power(2,o-1));
        end
%             if(mod(tempi,2)==0)
%             b1(m,n)=0;
%         else
%             b1(m,n)=1;
%         end
%         temp=mod(tempi,4);
%         b2(m,n)=idivide(temp,2);
%         temp=mod(tempi,8);
%         b3(m,n)=idivide(temp,4);
%         temp=mod(tempi,16);
%         b4(m,n)=idivide(temp,8);
%         temp=mod(tempi,32);
%         b5(m,n)=idivide(temp,16);
%         temp=mod(tempi,64);
%         b6(m,n)=idivide(temp,32);
%         temp=mod(tempi,128);
%         b7(m,n)=idivide(temp,64);
%         temp=mod(tempi,256);
%         b8(m,n)=idivide(temp,128);
    end
end
subplot(3,3,1), imshow(i);
title('orig');
subplot(3,3,2), imshow(b(:,:,1),[]);
title('bit 1');
subplot(3,3,3), imshow(b(:,:,2),[]);
title('bit 2');
subplot(3,3,4), imshow(b(:,:,3),[]);
title('bit 3');
subplot(3,3,5), imshow(b(:,:,4),[]);
title('bit 4');
subplot(3,3,6), imshow(b(:,:,5),[]);
title('bit 5');
subplot(3,3,7), imshow(b(:,:,6),[]);
title('bit 6');
subplot(3,3,8), imshow(b(:,:,7),[]);
title('bit 7');
subplot(3,3,9), imshow(b(:,:,8),[]);
title('bit 8');


new=rgb2gray(imread('gray.jpg'));
new=im2bw(new);
new=imresize(new,size(i));

z=input('bit plane to replace');
b(:,:,z)=new;
output=zeros(r,c);
for m=1:r
    for n=1:c
        w=0;
        for o=1:8
            w=w+(b(m,n,o)*power(2,o-1));
        end
        output(m,n)=w;
    end
end
figure,imshow(uint8(output));
figure,subplot(3,3,1), imshow(i);
title('orig');
subplot(3,3,2), imshow(b(:,:,1),[]);
title('bit 1');
subplot(3,3,3), imshow(b(:,:,2),[]);
title('bit 2');
subplot(3,3,4), imshow(b(:,:,3),[]);
title('bit 3');
subplot(3,3,5), imshow(b(:,:,4),[]);
title('bit 4');
subplot(3,3,6), imshow(b(:,:,5),[]);
title('bit 5');
subplot(3,3,7), imshow(b(:,:,6),[]);
title('bit 6');
subplot(3,3,8), imshow(b(:,:,7),[]);
title('bit 7');
subplot(3,3,9), imshow(b(:,:,8),[]);
title('bit 8');

%B=bitget(i,1); figure, imshow(logical(B));title('Bit plane 1');
% 
%B=bitget(i,2); figure, imshow(logical(B));title('Bit plane 2');
% 
% B=bitget(A,3); figure, imshow(logical(B));title('Bit plane 3');
% 
% B=bitget(A,4); figure, imshow(logical(B));title('Bit plane 4');
% 
% B=bitget(A,5); figure, imshow(logical(B));title('Bit plane 5');
% 
% B=bitget(A,6); figure, imshow(logical(B));title('Bit plane 6');
% 
% B=bitget(A,7); figure, imshow(logical(B));title('Bit plane 7');
% 
% B=bitget(A,8); figure, imshow(logical(B));title('Bit plane 8');