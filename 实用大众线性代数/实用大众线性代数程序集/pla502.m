% 《实用大众线性代数（MATLAB版）》例5.02程序pla502
%  斜体字母N的产生
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
x0=[0,0.5,0.5,6,6,5.5,5.5,0;0,0,6.42,0,8,8,1.58,8];
x=[x0,x0(:,1)];  		% 把首顶点坐标补到末顶点之后
A=[1,0.25;0,1]; y=A*x;
subplot(1,2,1),plot(x(1,:),x(2,:))
subplot(1,2,2),plot(y(1,:),y(2,:))
