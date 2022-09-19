%实际样本数据向量X，Y的联合熵,p是实际数据分成的段数
function H_XY=Interentroy_realdata(X,Y)
p=20;
n=length(X);%n是实际数据的维数
C=zeros(p,p);%存p*p个可能情况的个数，C(i,j)中保存向量X和Y组合类型的个数
for k=1:1:p
      for j=1:1:p
            P1=(X==k);
            P2=(Y==j);
            C(k,j)=sum(P1+P2==2);
      end
end        

D=C/n;%D保存各个组合出现的概率,E中保存各个组合的概率乘信息量
for i=1:1:p
    for j=1:1:p
        if D(i,j)~=0
           E(i,j)=-D(i,j)*log(D(i,j));
        else
           E(i,j)=0;            
        end
    end 
end
H_XY=sum(sum(E));

