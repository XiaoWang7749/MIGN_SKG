A=xlsread('D:\matlab\work\Mutual_Information\Workdatabases\I_C1','sheet1','G2:AU271');
n=20;%�ֳɵĶ���
C=Discrete_realdata(A); %����ʵ������ݽ�����ɢ��:����������ֳ���ȵ�20�Σ�A��ÿ���������������࣬���þ������C��
[m,k]=size(C); 
%�����Cÿһ������������Ϣ,�������H_C��
for i=1:1:m
    H_C(i)=Entroy_realdata(C(i,:));
end
%�����C���������е�������,�������H_C2��
for i=1:1:m
    for j=i+1:1:m
        H_C2(i,j)=Interentroy_realdata(C(i,:),C(j,:));
    end
end
%�����C���������еĻ���Ϣ,�������H_C2��,
for i=1:1:m
    for j=i+1:1:m
        I_2(i,j)=H_C(i)+H_C(j)-H_C2(i,j);
    end
end
 I_2_bingjun=I_2;
 save G:\matlab\matllab_new2\����Pֵ���������\����Ϣ\��ȫ����\I_2_bingjun  I_2_bingjun;