mu = [-7.0277, 1.3751];
samples = 1000000;
standard_deviation = 0.3;

tic

g1_fail = 0;
g2_fail = 0;
g3_fail = 0;

for i = 1:samples
    x = normrnd(mu,standard_deviation);  % x is a 1x2 array
    
    if (20-x(1)^2*x(2))>0
        g1_fail = g1_fail +1;
    end
    if (1-(x(1)+x(2)-5)^2/30-(x(1)-x(2)-12)^2/120)>0
        g2_fail = g2_fail +1;
    end
    if (x(1)^2+8*x(2)-75)>0
        g3_fail = g3_fail +1;
    end
end

toc

failure1_probability = g1_fail/samples
failure2_probability = g2_fail/samples
failure3_probability = g3_fail/samples