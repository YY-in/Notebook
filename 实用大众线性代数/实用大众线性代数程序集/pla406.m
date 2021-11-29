% 《实用大众线性代数（MATLAB版）》例题4.06程序pla406
%  三维向量组用最简形法分析线性相关性
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear, close all
v1=[-9,7,-3]',v2=[3,34,-24]',v3=[-6,-4,-9]',V=[v1,v2,v3]
b=[-10,13,19]',D=det(V),K=V\b
disp('增加列向量v4后向量组A=[v1,v2,v3,v4,b]的最简形分析')
pause
v4=[4,9,-7]',A=[v1,v2,v3,v4,b], U0=rref(A)
