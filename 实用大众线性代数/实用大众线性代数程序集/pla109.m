% 《实用大众线性代数（MATLAB版）》例题1.09程序pla109
%  金属薄板温度计算 
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
A=[1,-0.25,-0.25,0;-0.25,1,0,-0.25;-0.25,0,1,-0.25;0,-0.25,-0.25,1]
b=[7.5;15;10;17.5],
U0=rref([A,b])

