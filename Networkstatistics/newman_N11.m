%%E_0  为对称邻接矩阵利用newman快速算法求解社团结构cluster_final,I_salt_2为非孤立点形成的网络，且各边的权值都在阈值之上
 %%%结果说明：
 %%%%%%%cluster_final 第一列表示社团的序号，第二列表示该社团内的顶点的标号
 %%%%%%%%%%%in_out_final 每个社团的内外比（如果内外比为50 说明该社团是一个独立的社团）
%%%%%%%%  cluster_name 每个基因所属于的社团号
 %clear all
 %format short
%load G:\matlab\test\sys\I_A;
function Q=newman_N11(I_N11)
E_0=I_N11;  
in_out_value=0.2;%%设定社团的内外比    

 edge_num=nnz(E_0);%%%网络中总的边数的2倍
 E=(E_0>0)/edge_num;%%初始
 
 [p_0,q_0]=size(E);
 for i=1:p_0
     A(i)=sum(E(i,:));
 end %%初始
 
 
 for i=1:p_0
     B{i,1}=i;
     B{i,2}(1)=i;
 end %%%B{i,1}记录社团序号。B{i,2}记录社团i内的原始顶点的序号

  
 max_Q=-1;
 for k=10000:-1:0
     
 [p,p2]=size(E);
 max_q=-1;
 max_i=1;
 max_j=1;
 for i=1:p-1
     
     for j=i+1:p
         
         q=2*(E(i,j)-A(i)*A(j));
         if q>max_q%%%%模块度增量最大
             max_q=q;
             max_i=i;
             max_j=j;
         end
     end
 end
 E(max_i,:)=E(max_i,:)+E(max_j,:);%%%max_i max_j行相加到max_i行
 E(:,max_i)=E(:,max_i)+E(:,max_j);%%%max_i max_j列相加到max_i列
 A(max_i)=A(max_i)+A(max_j);%%%max_i max_j相加到max_i
 m=length(B{max_i,2});
 n=length(B{max_j,2});
 B{max_i,2}(m+1:m+n)=B{max_j,2};
 


  %%去掉E的max_j行
     E_new1(1:max_j-1,:)=E(1:max_j-1,:);
     A_new(1:max_j-1)=A(1:max_j-1);
     E_new1(max_j:p-1,:)=E(max_j+1:p,:);
     A_new(max_j:p-1)=A(max_j+1:p);
     for i=1:p
         if i<max_j
             B_new{i,1}=i; 
             B_new{i,2}=B{i,2};
         end
         if i>max_j
             B_new{i-1,1}=i-1; 
             B_new{i-1,2}=B{i,2};
         end
     end
 
 %%%%去掉E的max_j列
     E_new2(:,1:max_j-1)=E_new1(:,1:max_j-1);   
     E_new2(:,max_j:p-1)=E_new1(:,max_j+1:p);
 
        
 E=E_new2;
 A=A_new;
 B=B_new;
 

 
 %%%%%%%%%%%%%%%%%%%%%%
 %判断此时的社团是否达到Q最大。
 
 [p1,q1]=size(E);
 Tre=0;
 for i=1:p1
     Tre=Tre+E(i,i);
 end
 S=sum(E);
 Q=Tre-S*S';
 if Q>=max_Q
     max_Q=Q;
     E_final=E;
     A_final=A;
     B_final=B;
 end
 
 
 clear E_new1;
 clear E_new2;
 clear A_new;
 clear B_new;
len_A=length(A);
 if len_A==2
     break;
 end%%%当社团个数等于2时停止
 
 end
 
  %%%求解社团内外比，当该社团为 和其他社团为非联通时，记为100
[k1,k2]=size(E_final);
 for i=1:k1
     if E_final(i,i)==0
     in_out(i)=0;
     else
         t=sum(E_final(i,:))-E_final(i,i);
         if t==0
             in_out(i)=100;
         else
             in_out(i)=E_final(i,i)/t;
         end
     end
 end
 in_out=in_out/2;%%%%内外 比 
len_in_out=length(in_out);
k=1;
K1=[];
K2=[];
for i=1:len_in_out
    if in_out(i)>=in_out_value
    cluster_final{k,1}=k;
    cluster_final{k,2}=B_final{i,2};
    in_out_final(k)=in_out(i);
    k=k+1;
    else
    K1=[K1,B_final{i,2}];
    K2=[K2,i];%%记录合并的社团
    end
end
cluster_final{k,1}=k;
cluster_final{k,2}=K1;


%%计算合并社团的内外比
len_K2=length(K2);
in=0;
s=0;
for i=1:len_K2
    for j=1:len_K2
       in=in+E_final(K2(i),K2(j)) ;
    end
 s=s+sum(E_final(K2(i),:));
end
in_out_final(k)=in/(s-in)/2;

%%将每个基因所属社团号写入数据库
[a1,a2]=size(cluster_final);
for i=1:a1
    len=length(cluster_final{i,2});
    for j=1:len
        cluster_name(cluster_final{i,2}(j))=i;
    end
end
%S1=xlswrite('E:\MATLAB\R2008a\work\N11\N_G11',cluster_name','Sheet4','D5:D27');%%写入库2
%S2=xlswrite('E:\MATLAB\R2008a\work\N11\N_G11',in_out_final','Sheet4','E5:E27')%%%新建一个数据表
cluster_final_N11=cluster_final;%%%%%%%%%%%%%
%save cluster_final_N11 cluster_final_N11;
clear p;clear in_out;