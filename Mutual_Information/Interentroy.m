%��0-1����X��Y��������
function H_XY=Interentroy(X,Y)

%X=[0 1 1 0 1 1 1 0 0 0 0 0 1 1 1 1];
%Y=[1 1 1 0 1 0 1 0 1 0 0 0 1 1 0 1];
n=length(X);
XY_00=0;%����X��Y��Ӧ�����к�00�ĸ���
XY_01=0;%����X��Y��Ӧ�����к�01�ĸ���;
XY_10=0;%����X��Y��Ӧ�����к�10�ĸ���;
XY_11=0;%����X��Y��Ӧ�����к�11�ĸ���;
A=X+Y;
B=X-Y;

XY_00=nnz(A==0);
XY_01=nnz(B==-1);
XY_10=nnz(B==1);
XY_11=nnz(A==2);


p_00=XY_00/n;%����X��Y��Ӧ�����г���00�ĸ���
if p_00==0
   I_00=0;
else
   I_00=-p_00*log(p_00); 
end
p_01=XY_01/n;%����X��Y��Ӧ�����г���01�ĸ���
if p_01==0
   I_01=0;
else
  I_01=-p_01*log(p_01);  
end
p_10=XY_10/n;%����X��Y��Ӧ�����г���10�ĸ���
if p_10==0
   I_10=0;
else
  I_10=-p_10*log(p_10); 
end
p_11=XY_11/n;%����X��Y��Ӧ�����г���11�ĸ���
if p_11==0
   I_11=0;
else
  I_11=-p_11*log(p_11);   
end
H_XY=I_00+I_01+I_10+I_11;
        