%求向量C的熵,(概率为0时，它对熵的贡献为0),结果存入H_C中
function H_C=Entroy_realdata(C)
B=zeros(1,20);%C中属于各段的个数矩阵
%将所求的各段数据总数放入矩阵B
for k=1:20 %k记录数据所属的段数
   B(k)=sum(C==k);
end
m=length(C);
p=B/m;%表达数据中各段的概率矩阵

s=0;%计算向量C的熵
for j=1:1:20
    if  p(j)~=0 %只对不为0的概率计算熵
        s=s-p(j)*log(p(j));
    end
end
H_C=s;
