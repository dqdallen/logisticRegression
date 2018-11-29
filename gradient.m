%梯度下降法
function beta = gradient(alpha,beta,x,y,times)
	m = size(x,1);
	for i=1:times,		
		p1 = sigmoid(beta,x);
		
		beta = beta +x'*(y-p1')./m.*alpha;
		
	end;
	