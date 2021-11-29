% 《实用大众线性代数（MATLAB版）》例7.15程序pla715
%  简单线性规划问题的解
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear
f=[-2,-3],              % 键入原始数据f,A,B
A=[100,200;4,0;0,4], 
B=[800;16;12],
X=linprog(f,A,B)        % 调用线性规划程序求解X
zmax= -f*X              % 求出极大值

