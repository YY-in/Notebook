% ��ʵ�ô������Դ�����MATLAB�棩����5.6.5����pla565
% �����ɶ�������
%  �»�衱������������ӿƼ���ѧ�����磬2014��7��
%
clear,close all
A=[0,1;-4,-0.1], X0=[1;0]
for k=0:1000  t(k+1)=0.1*k; 
X(:,k+1)=X0'*expm(A*t(k+1)); end
plot(t,X(1,:))
set(gcf,'color','w'),pause,
[P,L]=eig(A)
for k=0:1000  t(k+1)=0.1*k; 
    X1(:,k+1)=X0'*P*[exp(L(1,1)*t(k+1)),0;0,exp(L(2,2)*t(k+1))]*inv(P);
end
E=X-X1;norm(E)
figure(2),plot(t,real(X1(2,:)))