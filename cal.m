
load('watermelon.txt');%读取数据
x = watermelon(:,(2:3));
y = watermelon(:,4);
x=[x,ones(size(x,1),1)];%在最后一列加1，用来表示常数项b
[xt,yt] = find(watermelon(:,4)==1);%查找分类为好瓜的

%画图

plot(x(xt,1),x(xt,2),'r+');
hold on;
[xt,yt] = find(watermelon(:,4)==0);%查找分类为好瓜的
plot(x(xt,1),x(xt,2),'bo');

%初始化beta
beta = zeros(size(x,2),1);
%alpha为梯度下降的步长，times循环次数
alpha = 0.01;times = 100000;
%梯度下降法
beta = gradient(alpha,beta,x,y,times);

[acc,error,P,R] = compare(beta,x,y)

hold on;
%画出决策边界
y1 = -beta(1,1)/beta(2,1)*1-beta(3,1)/beta(2,1);
plot([0,1],[-beta(3,1)/beta(2,1),y1]);
%牛顿法
%beta = Newton(beta,x,y,times);
%disp('newton，beta ');
%beta
%hold on;
%y1 = -beta(1,1)/beta(2,1)*1-beta(3,1)/beta(2,1);
%plot([0,1],[-beta(3,1)/beta(2,1),y1],'r');
