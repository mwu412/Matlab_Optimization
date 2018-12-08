clear
close all
clc

tic

%mu0 = [-8.4, 0.4];
mu0 = [-4, 4];
lb = [-10,0];
ub = [0,10];

% mu0 = [3.2, 3];
% lb = [0,10];
% ub = [0,10];

options = optimoptions('fmincon',...
    'Display','iter','Algorithm','sqp',...
    'MaxIterations',1500,'MaxFunctionEvaluations',1500);
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
[t_optm,fval,exitflag] = fmincon('obj',mu0,[],[],[],[],lb,ub,'mycon_FOSM',options)

toc