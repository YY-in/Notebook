function  arrow=tip(v,width);
% 在向量终端画箭头的子程序
[t,r]=cart2pol(-v(1),-v(2));
if r<width/4
 r=r/3;
else
 r=width/12;
end
slant=.3;
one=v+r*[cos(t+slant), sin(t+slant)];
two=v+r*[cos(t-slant), sin(t-slant)];
arrow=[one',two',v'];
