%������X����,(����Ϊ0ʱ�������صĹ���Ϊ0)
function H_X=Entroy(X)
n=length(X);
X_1=nnz(X);%����X�к�1�ĸ���
X_0=n-X_1;%����X�к�0�ĸ���
p_0=X_0/n;%����X��0���ֵĸ���
if p_0==0
   I_0=0;
else
  I_0=-p_0*log(p_0);  
end
p_1=X_1/n;%����X��1���ֵĸ���
if p_1==0
    I_1=0;
else
  I_1=-p_1*log(p_1);  
end
H_X=I_0+I_1;%����X����H_X
        