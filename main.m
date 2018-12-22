%% fmincon

x0 = [0.01 0.01] ;
lb = [0.001, 0.001] ;
ub = [10, 10] ;

options = optimoptions('fmincon',...
    'Display','iter','Algorithm','active-set');
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
[x,fval,exitflag] = fmincon('obj',x0,[],[],[],[],lb,ub,'mycon',options)

% %% Plot r1-r2 
% 
% % Figure Properties
% figure
% axis([0 0.4 0 0.4])  % x_min x_max y_min y_max
% axis equal  
% xticks(0:0.05:10)  % ticks (spacing)
% yticks(0:0.05:10)
% 
% % l = 9.14 ;  % m
% % density = 7860 ;  % kg/m^3
% % f = (6*pi*r(1)^2 + 4*pi*r(2)^2*sqrt(2)) * l * density ;
% 
% % Plot Lines
% x = linspace(0,0.4,100);  % (start, end, HOW MANY)
% y = sqrt((1e5/9.14/7860 - 6*pi*x.^2)/4/pi/sqrt(2));
% plot(x,y)
% hold on
% y = sqrt((1.5512e5/9.14/7860 - 6*pi*x.^2)/4/pi/sqrt(2));
% plot(x,y)
% hold on
% y = sqrt((2e5/9.14/7860 - 6*pi*x.^2)/4/pi/sqrt(2));
% plot(x,y)
% 
% % Plot the Optimum
% plot(0.2606, 0.2224, 'rx', 'MarkerSize', 20, 'LineWidth', 3)
% %text(0.2606, 0.2224, 'x (0.2606, 0.2224)','color','r','fontsize',13)
% 
% % Plot Feasible Area (with Dots)
% for r1 = 0:0.01:0.4
%     for r2 = 0:0.01:0.4
%         [c, ceq] = mycon([r1 r2]);
%         if c <= 0  % Mart where constraints are met
%             hold on  % to plot on the same figure
%             plot(r1, r2, 'bo')
%         end
%     end
% end
% 
% % Legend has it that
% legend('weight = 1e5','weight = 1.55e5','weight = 2e5','(0.2606, 0.2224)',...
%     'feasible area','Location','southwest')
% 
% % Figure Properties Part2
% title('Ten Bar Truss Problem')
% xlabel('r_1','FontSize',15); 
% ylabel('r_2','FontSize',15, 'rot', 90);
% 
% hold off

