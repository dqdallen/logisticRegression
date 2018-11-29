function [p] = sigmoid(beta,x)
	p = exp(beta'*x');
	p = p./(1+p);%求书中的p1
