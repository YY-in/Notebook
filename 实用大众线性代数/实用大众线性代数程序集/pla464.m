% 《实用大众线性代数（MATLAB版）》例题4.6.4程序pla464
%  混凝土配料问题
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear, close all
va=[20;10;20;10;0], vb=[18;10;25;5;2], vc=[12;10;15;15;8]
w1=[16;10;21;9;4], w2=[16;12;19;8;4]
v=[va,vb,vc], rv=rank(v),
rvw1=rank([v,w1]),
rvw2=rank([v,w2]),
U0=rref([v,w1,w2])
