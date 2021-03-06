clear
close all
clc
%% Problem 1
stress_56 = zeros(2, 1000);

for i = 1:1000
    length = 9.14 ;                 % unit: m
    E = normrnd(200e9,50) ;         % unit: Pa

    F = zeros(12,1) ;               % unit: N
    F(4) = -1e7 ;

    r = [normrnd(0.2,0.5), normrnd(0.3,0.3)];

    stress = Bar5and6( r, length, E, F );

    stress_56(1,i) = stress(1); 
    stress_56(2,i) = stress(2); 

end

nbins = 100000;

figure
% axis([-0.4e8 0.4e8 0 1000])

subplot(2,2,1)
hist(stress_56(1,:), nbins)
xlim([-5e9 5e9])
title('Stress - Bar No.5')

subplot(2,2,2)
hist(stress_56(2,:), nbins)
xlim([-5e9 5e9])
title('Stress - Bar No.6')

%% Problem 2

count = 0;
negative_count = 0;

for i = 1:1000000
    length = 9.14 ;                 % unit: m
    E = normrnd(200e9,50) ;         % unit: Pa

    F = zeros(12,1) ;               % unit: N
    F(4) = -1e7 ;

    r = [normrnd(0.2,0.5), normrnd(0.3,0.3)];

    stress_1 = Bar1(r, length, E, F);

    if stress_1 >= normrnd(250e6,100)
        count = count +1;
    end
    
    if stress_1 < 0
        negative_count = negative_count + 1;
    end
end
