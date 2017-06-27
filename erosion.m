A=[1 0 1 1 1; 1 0 1 1 0; 1 1 1 1 1;0 0 1 1 1];
B=[0 1 0;1 1 1;0 1 0]%structuring element
[r,c]=size(A);
C=zeros(r+2,c+2);
%Pad array with 0 on all sides
for p=2:size(C,1)-1
    for q=2:size(C,2)-1
        C(p,q)=A(p-1,q-1);
    end
end
D=false(size(A));
for i=2:size(C,1)-1
    for j=2:size(C,2)-1
        In=getNbrhd(C,i,j,3,3);
        %Find the position of ones in the structuring element
        flag=0;
        for p=1:3
            for q=1:3
                if((B(p,q)==1) && (In(p,q)==0))
                    flag=1;
                end
            end
        end
        if(flag==0)
            D(i-1,j-1)=1;
        end
    end
end
A
D