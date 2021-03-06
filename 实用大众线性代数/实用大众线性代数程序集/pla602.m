% 《实用大众线性代数（MATLAB版）》第六章例6.02程序pla602
%  交流电路计算
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear, format compact
Z1=-j*250;Z2=250;ki=0.5;Is=2+j*0;
zL=500+j*500;						% 设定元件参数
a11=1/Z1+1/Z2;a12=-1/Z2;a13=0;	% 设定系数矩阵A
a21=-1/Z2;a22=1/Z2-1/zL;a23=-ki;
a31=1/Z1;a32=0;a33=-1;
A=[a11,a12,a13;a21,a22,a23;a31,a32,a33];
B=[1;0;0];	% 设定系数矩阵B
X=A\B*Is;	% 求方程解X=[Ua;Ub;I1]
Ub=X(2)     % 负载电压
absUb=abs(Ub)           % 负载电压的幅度
angleUb=angle(Ub)*180/pi   % 负载电压的相角
compass(Ub)
set(gcf,'color','w')