function [R,I_new2,I]=formatnet_N11(I_N11,threshold)
%%%���ǹ�����ѡȡ�������γ�����
%clear
%load G:\matlab\matllab_new2\����Pֵ���������\����Ϣ\���㻥��Ϣ\����Ϣ����\I_2_bingjun;%����Ϣ���� ����
%threshold=xlsread('G:\matlab\matllab_new2\database\work_database\bingjun','table_bingjun','DR2:DR2');

I=(I_N11>threshold).*I_N11;
[m,n]=size(I);
k=0;I_new2=[];I_new1=[];
for i=1:m
    row_sum=max(I(i,:));
    if row_sum>0
        k=k+1;
        I_new1(k,:)=I(i,:);
    end
end
k=0;
for i=1:m
    col_sum=max(I(:,i));
    if col_sum>0
        k=k+1;
        I_new2(:,k)=I_new1(:,i);
    end
end
    
[m1,n1]=size(I_new2);
R=m1/m;
%I_N11=I_new2;
%save IS_N11 IS_N11;