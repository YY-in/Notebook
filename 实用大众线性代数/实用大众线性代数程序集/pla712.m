% 《实用大众线性代数（MATLAB版）》第七章例7.12程序pla712
%  金融公司支付基金
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear
A=[0.9,0.12;0.1,0.88]
[P,D] = eig(A)
X0=[2600;2800]
k=input('k= ')
Xkp1=P*[D(1,1)^k,0;0,D(2,2)^k]*inv(P)*X0

