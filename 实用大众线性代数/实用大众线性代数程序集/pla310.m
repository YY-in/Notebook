% ��ʵ�ô������Դ�����MATLAB�棩������3.10����pla310
%  ��������ֵ�����������Ľ�
%  �»�衱������������ӿƼ���ѧ�����磬2014��7��
%
clear, close all
format rat,
A=[1.5,0;0,1],  
c=poly(A),  
lambda=roots(c)
p(:,1)=null([A-lambda(1)*eye(2)],'r');
p(:,2)=null([A-lambda(2)*eye(2)],'r')
[p1,L1]=eig(A)
