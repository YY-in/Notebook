% 《实用大众线性代数（MATLAB版）》例6.15程序pla615
%  宏观经济模型
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear,close all
V=[0.5,0.4,0.2;0.2,0.35,0.15;0.15,0.1,0.3] 
d = [30;20;10]
x = inv(eye(3)-V) * d
