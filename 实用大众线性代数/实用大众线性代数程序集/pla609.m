% 《实用大众线性代数（MATLAB版）》第六章例6.9程序pla609
%  飞机和军舰甲板方向的测定问题
%  陈怀琛编著，西安电子科技大学出版社，2014年7月
%
clear,close all
A=[100,109.95,105.47,104.476;200,199.002,204.476,194.526]   % 标志点的坐标系
% A=[100,109.95,105.47,104.476;100,99.002,104.476,94.526]
S=A-A(:,1)*ones(1,4)        % 差向量组的构成
S1=S(:,[2:4,1])             % 把舰主轴向量放在第一个位置
[Q,R]=qr(S1)                % 作QR分解
Theta=asin(Q(2,1))          % 求机上坐标与舰坐标之间的夹角