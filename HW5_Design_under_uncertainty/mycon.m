 function [c,ceq] = mycon(mu)

samples = 100;
standard_deviation = 0.3;


%% Method 1: Matrix
% tic
% cov = [standard_deviation^2 0; 0 standard_deviation^2];
% randx = mvnrnd(mu, cov, samples);
% 
% g1_out = 20-randx(:,1)*transpose(randx(:,1))*randx(:,2);
% g1_fail = sum(g1_out>0);
% 
% g1_out = 1-(randx(:,1)+randx(:,2)-5)*transpose((randx(:,1)+randx(:,2)-5))/30-(randx(:,1) ...
%           -randx(:,2)-12)^2/120;
% g2_fail = sum(g2_out>0);
% 
% g1_out = x(:,1)*transpose(x(:,1))+8*x(:,2)-75;
% g3_fail = sum(g3_out>0);
% toc

%% Method 2: For loop
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

%% The constrain
c1 = g1_fail - 0.0013 * samples;
c2 = g2_fail - 0.0013 * samples;
c3 = g3_fail - 0.0013 * samples;

c = [c1, c2, c3];
ceq = [];