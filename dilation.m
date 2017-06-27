A=[1 0 1 1 1; 1 0 1 1 0; 1 1 1 1 1;0 0 1 1 1];
B=[0 1 0;1 1 1;0 1 0]
[r,c]=size(A);
incrAr=(2*(size(B,1)-1));%=4
incrAc=(2*(size(B,2)-1));
C=zeros(r+incrAr,c+incrAc);

for p=(incrAr/2)+1:size(C,1)-2%start at 3
    for q=(incrAc/2)+1:size(C,2)-2
        C(p,q)=A(p-2,q-2);
    end
end
D=false(r+4,c+4);
for i=2:size(C,1)-1
    for j=2:size(C,2)-1
        In=getNbrhd(C,i,j,3,3);
        flag=0;
        for p=1:3
            for q=1:3
                if((B(p,q)==1) && (In(p,q)==1))
                    flag=1;
                end
            end
        end
        if(flag==1)
            D(i,j)=1;
        end
    end
end
A
D