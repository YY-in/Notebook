% 《实用大众线性代数（MATLAB版）》第七章例6.01程序pla601
% 直流电路计算
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear,close all
A=[18,-12,0; -12,28,-12; 0,-12,18]; 
b=[1;0;0]; us=10;
U=rref([A,b*us])

