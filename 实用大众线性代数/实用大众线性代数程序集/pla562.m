% ��ʵ�ô������Դ�����MATLAB�棩����5.6.2����pla562
%  �����״������������������ת��
%  �»�衱������������ӿƼ���ѧ�����磬2014��7��
%
clear,close all
syms s f r
format compact,
Q1=[cos(s),-sin(s),0;sin(s),cos(s),0;0,0,1]
Q2=[cos(f),0,-sin(f);0,1,0;sin(f),0,cos(f)]
Q=Q2*Q1,
Xm=r*Q(:,1)
Xmr=subs(Xm,[s,f,r],[30*pi/180,60*pi/180,10])
