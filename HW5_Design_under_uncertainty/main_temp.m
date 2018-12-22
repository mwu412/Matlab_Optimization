mu0 = [0, 0];
lb = [-3,-3];
ub = [3,3];

% mu0 = [3.2, 3];
% lb = [0,10];
% ub = [0,10];

options = optimoptions('fmincon',...
    'Display','iter',...
    'MaxIterations',1500,'MaxFunctionEvaluations',1500);
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
[t_optm,fval,exitflag] = fmincon('obj_temp',mu0,[],[],[],[],lb,ub,[],options)