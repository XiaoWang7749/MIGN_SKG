%%����ȷ����ֵ֮��������ͳ���� �ȷֲ� ƽ��·������ ƽ������ϵ�� ģ��� �ǹ��������
 %%%���иĳ���ʱ���޸ĵ��ó����·����
clear; clc;

load D:\matlab\work\Mutual_Information\MI_Results\I_E1;  %%  n * n �ľ���
 
threshold=0.1:0.02:0.9;
%threshold=xlsread('the Excel file name(include the path)','the name of sheet','a specific rectangular region (range) in Excel to save MI thresholds');

[R,I_new2,I]=formatnet_N11(I_N11,threshold(20));

%I=I_N11;
  
 [m,n]=size(I);%%%nΪ�ܵĽڵ���

[m1,n1]=size(I_new2);

%%I Ϊ�Գƾ���
matr_ones=ones(n1,n1);
 G=sparse((I_new2>0).*matr_ones);%%graph,Ȩ��Ϊ1
 %&*&*&&*&*&*&*&*&*&*&*&*�ȷֲ����� 
 for i=1:n
 degr(i)=nnz(I(i,:)>0);%%ÿ���ڵ�Ķ���
 end
 max_degr=max(degr);
 for i=0:max_degr
     p=nnz(degr==i);
     degr_num(i+1)=p;
 end
 output='ƽ����Ϊ��'
 sum(degr)/m
 %degree=0:max_degr;
 %plot(degree,degr_num,'-d')
%xlabel('degree')
%ylabel('the number of genes')
 %figure
%plot(degree,degr_num,'-d')
%xlabel('����')
%ylabel('������')
 
 
 %%&*&*&*&*&*&*&*&*&*&*&*ƽ��·������
 sum_path=0;
 for i=1:n1
     
  [DIST,p,PRED] = graphshortestpath(G,i);
     for j=1:n1
         p_len=length(p{j});
         sum_path=sum_path+p_len-1;
     end
     clear p;
 end
  output='ƽ��·������Ϊ��'
  aver_path=2*sum_path/n1/(n1-1) 
  
  output='�ǹ��������Ϊ��'
  R
  
  %&*&*&**&*&*&*&*&*&*&*&*&*&ƽ������ϵ��
  coef=clusteringcoef(G);
  output='ƽ������ϵ��Ϊ��'
  aver_cluseringcoef=mean(coef)
  
 Q=newman_N11(I_new2); 
 output='ģ���Ϊ��'
 Q
 yy=[sum(degr)/m,R,aver_path,aver_cluseringcoef,Q];