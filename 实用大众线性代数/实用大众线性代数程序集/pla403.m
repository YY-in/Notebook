% ��ʵ�ô������Դ�����MATLAB�棩������4.03����pla403
%  ƽ����������������ϵĻ���
%  �»�衱������������ӿƼ���ѧ�����磬2014��7��
%
u=[4;2],v=[-1.5;3],x0=[1;0],
u0=u/norm(u), v0=v/norm(v)
thetau=acos(u0'*x0),thetav=acos(v0'*x0),
thetauv=acos(u0'*v0)
plotangle(u,v);     % ��Ϊ����ר�û�ͼ�ӳ���
grid on
set(gcf,'color','w')
axis([-2 5 -1 6])