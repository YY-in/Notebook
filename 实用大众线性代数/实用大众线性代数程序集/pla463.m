% 《实用大众线性代数（MATLAB版）》例题4.6.3程序pla463
%  价格平衡模型
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
V=[0.,0.4,0.6;0.6,0.1,0.2;0.4,0.5,0.2]
U0 = rref([(eye(3)-V),zeros(3,1)])
