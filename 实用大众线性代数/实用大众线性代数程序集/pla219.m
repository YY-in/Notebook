% 《实用大众线性代数（MATLAB版）》例题2.19程序pla219
%  电路网络的串联
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear, close all
syms R1 R2
A1=[1,-R1;0,1]      % 第一级网络的传输矩阵
A2=[1,0;-1/R2,1]    % 第二级网络的传输矩阵
A=A2*A1             % 总的传输矩阵
