function [acc,error,P,R]=compare(beta,x,y)
	p = exp(x*beta);
	p = p./(1+p)
	TN=0;TP=0;FN=0;FP=0;
	m = size(y,1);
	for i=1:size(y,1),
		if p(i,1) >= 0.5,
			t = 1;
		else
			t = 0;
		end;
		if t == y(i,1),
			if t == 1,
				TP = TP + 1;
			else
				TN = TN + 1;
			end;
		else
			if t == 1,
				FP = FP + 1;
			else
				FN = FN + 1;
			end;
		end;
	end;
	error = (FP + FN)/m;
	acc = 1 - error;
	P = TP/(TP+FP);
	R = TP/(TP+FN);
	
		