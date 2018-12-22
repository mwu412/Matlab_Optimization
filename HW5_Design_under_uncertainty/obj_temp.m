function f = obj_temp(mu) 

x = mu(1);
y = mu(2);
f = -((1-x)^2*exp(-x^2-(y+1)^2)-(x-x^3-y^3)*exp(-x^2-y^2));