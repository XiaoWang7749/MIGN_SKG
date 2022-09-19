A=xlsread('D:\matlab\work\Mutual_Information\Workdatabases\I_C1','sheet1','G2:AU271');
n=20;%分成的段数
C=Discrete_realdata(A); %对真实表达数据进行离散化:将整个矩阵分成相等的20段，A中每个数据所属的种类，所得矩阵放在C中
[m,k]=size(C); 
%求矩阵C每一行向量的自信息,结果存入H_C中
for i=1:1:m
    H_C(i)=Entroy_realdata(C(i,:));
end
%求矩阵C中任意两行的联合熵,结果存入H_C2中
for i=1:1:m
    for j=i+1:1:m
        H_C2(i,j)=Interentroy_realdata(C(i,:),C(j,:));
    end
end
%求矩阵C中任意两行的互信息,结果存入H_C2中,
for i=1:1:m
    for j=i+1:1:m
        I_2(i,j)=H_C(i)+H_C(j)-H_C2(i,j);
    end
end
 I_2_bingjun=I_2;
 save G:\matlab\matllab_new2\利用P值计算相关性\互信息\完全网络\I_2_bingjun  I_2_bingjun;