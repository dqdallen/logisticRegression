%牛顿法
function beta = Newton(beta,x,y,times)
	m=size(x,1);
	
	t=0;
	for i=1:times,
		p = sigmoid(beta,x);
		der1 = x'*(y-p').*(-1); %一阶导数
		for j=1:m,              %二阶导数求和
			p1 = sigmoid(beta,x(j,:));
			t = t + x(j,:)*x(j,:)'*p1*(1-p1);
		end;
		beta = beta - der1 ./ t;
	end;
	