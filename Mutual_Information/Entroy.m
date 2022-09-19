%求向量X的熵,(概率为0时，它对熵的贡献为0)
function H_X=Entroy(X)
n=length(X);
X_1=nnz(X);%向量X中含1的个数
X_0=n-X_1;%向量X中含0的个数
p_0=X_0/n;%向量X中0出现的概率
if p_0==0
   I_0=0;
else
  I_0=-p_0*log(p_0);  
end
p_1=X_1/n;%向量X中1出现的概率
if p_1==0
    I_1=0;
else
  I_1=-p_1*log(p_1);  
end
H_X=I_0+I_1;%向量X的熵H_X
        