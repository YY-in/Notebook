% 《实用大众线性代数（MATLAB版）》第七章例7.2程序pla702
%  梯形格型数字滤波器的系统函数
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear,close all
syms q           				% 对符号变量进行定义
k1=1/4; k2=1/2; k3=1/3; k0=1;		% 給网络中的常数
C0=-0.2; C1=0.8; C2=1.5; C3=1;
Q(4,7)=q;		        				% Q的第一个赋值元素为符号变量
Q(5,2)=1; Q(1,4)=-k3; Q(2,1)=1;		% 为联接矩阵的非零元素赋值
Q(3,2)=k3; Q(3,4)=1; Q(5,8)=-k2;
Q(6,5)=1; Q(7,6)=k2; Q(7,8)=1;
Q(8,11)=q; Q(9,6)=1;
Q(9,12)=-k1; Q(10,9)=1;
Q(11,10)=k1; Q(11,12)=1; Q(12,10)=q;
Q(13,3)=C3; Q(13,7)=C2;
Q(13,11)=C1; Q(13,12)=C0;
Q(13,13)=0; P(1,1)=k0; P(13,1)=0;	%给右下角元素赋值，使未赋值元素全为零
W=inv(eye(size(Q))-Q)*P				% 信号流图方程解
pretty(W(13))						% 以美观的形式显示W中第13行	
