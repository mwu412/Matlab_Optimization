clear
close all
clc

figure

for x1 = -20:0.5:20  
    for x2 = -20:0.5:20  
        if (20-x1*x1*x2) <= 0
            plot(x1, x2, 'bo')
            hold on
        end
        if (1-((x1+x2-5)^2)/30-((x1-x2-12)^2)/120) <= 0
            plot(x1, x2, 'rx')
            hold on
        end
        if (x1^2+8*x2-75) <= 0
            plot(x1, x2, 'gs')
            hold on
        end 
    end
end


title('Feasible Area')
xlabel('X1','FontSize',15); 
ylabel('X2','FontSize',15, 'rot', 90);


%legend('g1','g2','g3')