% 《实用大众线性代数（MATLAB版）》例题3.04程序pla304
%  行列式计算
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear
A = [10,8,6,4; 2,5,8,9; 6,0,9,9; 5,8,7,4];
U1=ref1(A) 				% 分解为行阶梯矩阵U1,也可用[L,U] =lu(A)求U,
D =prod(diag(U1))			% 求主对角元素的连乘积
D1=det(A)