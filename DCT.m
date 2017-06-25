clear;
clc;
%image=double((imread('testgray.jpg')));
image=zeros(2,2);
k=1;
for i=1:2
    for j=1:2
        image(i,j)=k;
        k=k+1;
    end
end
[M,N]=size(image);
Dct=zeros(size(image));
cosine = inline('cos((((2*x)+1)*pi*u)/(2*M))', 'x', 'u', 'M');
alpha0=inline('(power((1/M),0.5))','M');
alpha=inline('(power((2/M),0.5))','M');

for u=1:M
    for v=1:N
        s=0;
        if(u==1)
            alphau=alpha0(M);
        else
            alphau=alpha(M);
        end
        if(v==1)
            alphav=alpha0(N);
        else
            alphav=alpha(N);
        end
        alph=alphau*alphav;
        for x=1:M
            for y=1:N
                s=s+((image(x,y))*cosine(x-1,u-1,M)*cosine(y-1,v-1,N));
            end
        end
        Dct(u,v)=alph*s;
    end
end
Dct
% Idct=zeros(size(i));
% for x=1:M
%     for y=1:N
%         s=0;
%         COS=0;
%         alph=0;
%         for u=1:M
%             for v=1:N
%                 if(u==1)
%                     alphau=alpha0(M);
%                 else
%                     alphau=alpha(M);
%                 end
%                 if(v==1)
%                     alphav=alpha0(N);
%                 else
%                     alphav=alpha(N);
%                 end
%                 alph=alphau*alphav;
%                 COS=cosine(x-1,u-1,M)*cosine(y-1,v-1,N);
%                 s=s+(COS*alph*Dct(u,v));
%             end
%         end
%         Idct(u,v)=s;
%     end
% end
% figure,imshow(uint8(image))
% figure,imshow(uint8(Idct))
%Idct not giving correct ans.

% function[z]=cosine(x,u,M)
% z=cos((((2*x)+1)*pi*u)/(2*M))
% end
% function[y]=alpha(u,M)%u is for both u,v and M for M,N
% if(u==0)
%     y=pow((1/M),0.5);
% else
%     y=pow((2/M),0.5);
% end
% end
