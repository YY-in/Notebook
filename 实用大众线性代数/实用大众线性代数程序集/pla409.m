% ��ʵ�ô������Դ�����MATLAB�棩��ͼ4.09����pla409
%  ����������1.2(d)�Ľ⼰ͼ
%  �»�衱������������ӿƼ���ѧ�����磬2014��7��
%
clear, close all
A=[1,1;1,-1;-1,2],b=[-1;3;-3]
xhat1=pinv(A)*b
xhat2=inv(A'*A)*A'*b
xhat3=A\b
norme=norm(A*xhat1-b)
ezplot('x+y+1')
hold on, grid on
ezplot('x-y-3'),hold  on
%plot(1.85,-0.71,'*')
set(gcf,'color','w')
ezplot('-x+2*y+3'),hold on
plot(xhat1(1),xhat1(2),'*')