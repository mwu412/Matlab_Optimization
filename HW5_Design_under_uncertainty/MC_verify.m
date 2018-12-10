mu = [-7.0277, 1.3751];
samples = 1000000;
standard_deviation = 0.3;

tic

g_fail = 0;

for i = 1:samples
    x = normrnd(mu,standard_deviation);  % x is a 1x2 array
    
    if (20-x(1)^2*x(2))>0
        g_fail = g_fail +1;
        continue
    end
    if (1-(x(1)+x(2)-5)^2/30-(x(1)-x(2)-12)^2/120)>0
        g_fail = g_fail +1;
        continue
    end
    if (x(1)^2+8*x(2)-75)>0
        g_fail = g_fail +1;
        continue
    end
end

toc

failure_probability = g_fail/samples