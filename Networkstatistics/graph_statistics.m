%%计算确定阈值之后的网络的统计量 度分布 平均路径长度 平均聚类系数 模块度 非孤立点比例
 %%%运行改程序时需修改到该程序的路径下
clear; clc;

load D:\matlab\work\Mutual_Information\MI_Results\I_E1;  %%  n * n 的矩阵
 
threshold=0.1:0.02:0.9;
%threshold=xlsread('the Excel file name(include the path)','the name of sheet','a specific rectangular region (range) in Excel to save MI thresholds');

[R,I_new2,I]=formatnet_N11(I_N11,threshold(20));

%I=I_N11;
  
 [m,n]=size(I);%%%n为总的节点数

[m1,n1]=size(I_new2);

%%I 为对称矩阵
matr_ones=ones(n1,n1);
 G=sparse((I_new2>0).*matr_ones);%%graph,权重为1
 %&*&*&&*&*&*&*&*&*&*&*&*度分布曲线 
 for i=1:n
 degr(i)=nnz(I(i,:)>0);%%每个节点的度数
 end
 max_degr=max(degr);
 for i=0:max_degr
     p=nnz(degr==i);
     degr_num(i+1)=p;
 end
 output='平均度为：'
 sum(degr)/m
 %degree=0:max_degr;
 %plot(degree,degr_num,'-d')
%xlabel('degree')
%ylabel('the number of genes')
 %figure
%plot(degree,degr_num,'-d')
%xlabel('度数')
%ylabel('基因数')
 
 
 %%&*&*&*&*&*&*&*&*&*&*&*平均路径长度
 sum_path=0;
 for i=1:n1
     
  [DIST,p,PRED] = graphshortestpath(G,i);
     for j=1:n1
         p_len=length(p{j});
         sum_path=sum_path+p_len-1;
     end
     clear p;
 end
  output='平均路径长度为：'
  aver_path=2*sum_path/n1/(n1-1) 
  
  output='非孤立点比例为：'
  R
  
  %&*&*&**&*&*&*&*&*&*&*&*&*&平均聚类系数
  coef=clusteringcoef(G);
  output='平均聚类系数为：'
  aver_cluseringcoef=mean(coef)
  
 Q=newman_N11(I_new2); 
 output='模块度为：'
 Q
 yy=[sum(degr)/m,R,aver_path,aver_cluseringcoef,Q];