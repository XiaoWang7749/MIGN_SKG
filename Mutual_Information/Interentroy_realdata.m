%ʵ��������������X��Y��������,p��ʵ�����ݷֳɵĶ���
function H_XY=Interentroy_realdata(X,Y)
p=20;
n=length(X);%n��ʵ�����ݵ�ά��
C=zeros(p,p);%��p*p����������ĸ�����C(i,j)�б�������X��Y������͵ĸ���
for k=1:1:p
      for j=1:1:p
            P1=(X==k);
            P2=(Y==j);
            C(k,j)=sum(P1+P2==2);
      end
end        

D=C/n;%D���������ϳ��ֵĸ���,E�б��������ϵĸ��ʳ���Ϣ��
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

